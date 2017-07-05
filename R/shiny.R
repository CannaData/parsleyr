#' Submit button for validation
#' @export
#' @import shiny
#' @inheritParams shiny::actionButton
#' @param formId ID of form to validate
submit_form <- function(inputId, label, icon = NULL, width = NULL, ..., formId) {
  x <- match.call()
  x[[1]] <- quote(shiny::actionButton)
  shiny::tagList(eval(x),
                 shiny::tags$script(shiny::HTML(
                   paste0(
                     "$(document).on('shiny:inputchanged', function(event) {
                     if (event.name === '",
                     inputId,
                     "' && event.inputType === 'shiny.action') {
                      ",if (missing(formId)) { 
                        "var form = $('#' + event.name).closest('form').parsley();" 
                        } else {
                          paste0("var form = $('#",formId,"').parsley();")
                        }, "
                     if (!form.validate()) {
                     event.preventDefault();
                     }
}
});"
   )
  )))
}