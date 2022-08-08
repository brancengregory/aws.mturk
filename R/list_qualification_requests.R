#'
#' @title List Qualification Requests
#' @description Lists requests for Qualifications of a particular Qualification type
#' @return If successful, a list of Qualification Requests
#' @export
#'
#' @param id The id of the Qualification Type
#'
list_qualification_requests <- function(
    id
) {

  rlang::check_required(
  )

  assertthat::assert_that(
  )

  b <- list(
    QualificationTypeId = id
  )

  res <- mturkHTTP(
    action = "ListQualificaitonRequests",
    body = b
  )
}
