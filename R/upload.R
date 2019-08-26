#' Upload Excel worksheets to SDR
#'
#' \code{upload} is an internal function that uploads all Excel worksheets in a specified location to the SDR.
#' The destination table is determined by the sheet name; if a table with a matching name exists it is over-written, if not it is created.
#'
#' @param source \code{string}. The path of the directory containg the Excel workbooks to be uploaded.
#'
#' @return \code{null}
#'
#' @examples
#'
#' \dontrun {
#' upload("path_of_source_directory")
#' }
#'
#' @keywords internal
#'
#' @noRd

upload <- function(source) {

  files <- list.files(source)

  for (file in files) {

    file_path <- file.path(source, file_name)
    worksheets <- readxl::excel_sheets(file_path)

    for (worksheet in worksheets) {

      df <- readxl::read_excel(file_path, sheet = worksheet)
      # TODO: Should sheet name be table name, or book/file name???
      # TODO: Replace saveRDS with save to table
      # saveRDS(df, file = paste0("test_save\\", worksheet, ".Rds"))

      print("Format 1:")
      print(str(df))
      print("Format 2:")
      print(sapply(df, typeof))
    }
  }
}
