#'
#' @title Delete Qualification Type
#' @description Deletes a Qualification Type
#' @return If successful, empty body and no errors
#' @export
#'
#' @param id The id of the Qualification type
#'
delete_qualification_type <- function(
    id
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
  )

  b <- list(
    QualificationTypeId = id
  )

  res <- mturkHTTP(
    action = "DeleteQualificationType",
    body = b
  )
}
