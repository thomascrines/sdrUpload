#' Upload Excel worksheets to SDR
#'
#' \code{sdr_upload} uploads all Excel worksheets in a specified location to a specified database.
#'
#' @param source \code{string}. The path of the directory containing Excel files.
#' @param archive \code{string}. The path of the directory to send processed files to.
#' @param database \code{string}. The database to write the data to.
#' @param server \code{string}. The server holding the database.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun{
#' sdr_upload("C://example_source", "C://example_archive", "database_name", "server_name")
#' }
#'
#' @export

sdr_upload <- function(source, archive, database, server) {

  # CREATE DATABASE CONNECTION

  tryCatch({
    connection <- sdrUpload:::sdr_create_connection(database = database, server = server)
    print(paste0("Connected to database ", database, ", on server ", server))
  },
  error = function(cond) {
    message(paste0("Failed to create connection to database: ", database, " on server: ", server))
    message(paste0("Original error message: ", cond))
  })

  # GET LIST OF FILES IN SOURCE DIRECTORY

  files <- list.files(path = source)

  if (length(files) > 0) {
    print(paste0("Found files: ", files, " in directory ", directory))
  }
  else {
    print(paste0("No files found in ", source))
  }

  for (file in files) {

    # Set full file path
    file_path <- file.path(source, file)

    print(paste0("Processing file ", file))

    # Get all worksheet names in file
    worksheets <- tryCatch({readxl::excel_sheets(file_path)},
                           error = function(cond) {
                             message(paste0("Failed to read sheets from file: ", file_path))
                             message(paste0("Original error message: ", cond))
                             stop()
                           })

    for (worksheet in worksheets) {

      # Read each worksheet in file
      df <- tryCatch({readxl::read_excel(file_path, sheet = worksheet)},
                     error = function(cond) {
                       message(paste0("Failed to read worksheet: ", worksheet, " from file: ", file_path))
                       message(paste0("Original error message: ", cond))
                       stop()
                     })

      database_table_name <- gsub(" ", "_", paste0(tolower(gsub("\\..*", "", file)), "_", tolower(worksheet)))

      # Write Excel sheet to new table in connection
      tryCatch({
        odbc::dbWriteTable(conn = connection, name = database_table_name, value = df)
        print(paste0("Excel worksheet ", worksheet, " successfully written to ", database_table_name))
        },
               error = function(cond) {
                 message(paste0("Failed to write worksheet: ", worksheet, " to database: ", database))
                 message(paste0("The table may already exist in the database."))
                 message(paste0("Original error message: ", cond))
                 stop()
               })
    }

    sdrUpload:::sdr_archive_file(source, archive, file)
    print(paste0(file, " successfully processed and moved from ", source, " to ", archive))
  }

  odbc::dbDisconnect(connection)
  print("Database connection closed")
  print("Processing complete")
}
