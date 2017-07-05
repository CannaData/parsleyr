#' Submit button for validation
#' @export
#' @import shiny
#' @inheritParams shiny::actionButton
submit_form <- function(inputId, label, icon = NULL, width = NULL, ...) {
  x <- match.call()
  x[[1]] <- quote(shiny::actionButton)
  shiny::tagList(eval(x),
                 shiny::tags$script(shiny::HTML(
                   paste0(
                     "$(document).on('shiny:inputchanged', function(event) {
                     if (event.name === '",
                     inputId,
                     "' && event.inputType === 'shiny.action') {
                      var form = $('#' + event.name).closest('form').parsley();
                     if (!form.validate()) {
                     event.preventDefault();
                     }
}
});"
   )
  )))
}