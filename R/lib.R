#' Include parsley.js
#' 
#' @param cdn Boolean indicating whether to pull dependency from CDN
#' @importFrom htmltools htmlDependency includeCSS
#' @export
#' 

parsleyLib <- function(cdn = TRUE) {
  htmltools::htmlDependency(
    "parsley.js", "2.7.2", 
    src = if (cdn) {
      c(href = "https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.7.2/")
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