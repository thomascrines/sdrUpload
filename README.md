
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sdrUpload

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Travis-CI Build
Status](https://api.travis-ci.org/thomascrines/sdrUpload.svg?branch=master)](https://travis-ci.org/thomascrines/sdrUpload)
<!-- badges: end -->

:construction: :construction: :construction: **Package under
construction - watch this space for updates** :construction:
:construction: :construction:

Use sdrUpload to upload Excel spreadsheets from a specified directory to
a named database, and move the files to an ‘archive’ folder.

## Installation

Install opendatascot from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("thomascrines/sdrUpload")
```

If the above does not work, you can install from source:

1.  Go to the sdrUpload
    [repository](https://github.com/thomascrines/sdrUpload) on GitHub
2.  Click **Clone or download** then **Download ZIP**
3.  Save the file locally (e.g. your H drive) and Unzip
4.  Install with install.packages()

<!-- end list -->

``` r
install.packages("your/directory/sdrUpload", repos = NULL,
                 type="source", lib = "your/R/package/library/directory")
```

## Examples

Write data from Excel sheets contained in a source directory to SDR
database tables, and move files to an archive folder: `sdr_upload(source
= "C:\\example_source", archive = "C:\\example_archive", database =
"DatabaseName", server = "ServerName")`

Delete a table from a specified connection: `sdr_delete_table(table =
"TableName", database = "DatabaseName", server = "ServerName")`

Return a list of tables in a database: `sdr_list_tables(database =
"DatabaseName", server = "DatabaseServer")`

Return data from a database table: `sdr_list_tables(database =
"DatabaseName", server = "ServerName", table = "TableName")`
