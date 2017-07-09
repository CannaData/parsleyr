#' Include parsley.js
#' 
#' @param cdn Boolean indicating whether to pull dependency from CDN
#' @importFrom htmltools htmlDependency includeCSS
#' @export
#' 

parsleyLib <- function(cdn = TRUE, css = FALSE) {
  htmltools::htmlDependency(
    "parsley.js", "2.7.2", 
    src = if (cdn) {
      c(href = "http://parsleyjs.org/dist/")
    } else {
      c(file = system.file(package = "parsleyr", "javascript", "parsley.js"))
    },
    script = "parsley.min.js", all_files = FALSE
  )
}

#' @rdname parsleyLib
#' @export
parsleyrCSS <- function() {
  shiny::includeCSS(
    system.file(package = "parsleyr", "css", "parsleyr.css")
  )
}