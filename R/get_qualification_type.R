#'
#' @title Get Qualification Type
#' @description Gets information about a Qualification type using its id
#' @return If successful, a Qualification Type object
#' @export
#'
#' @param id The id of the Qualification Type.
#'
get_qualification_type <- function(
    id
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    QualificationTypeId = id
  )

  res <- mturkHTTP(
    action = "GetQualificationType",
    body = b
  )
}
