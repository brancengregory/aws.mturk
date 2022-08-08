#'
#' @title Get Qualification Score
#' @description Gets the Value of a Worker's Qualification for a given Qualification type
#' @return If successful, a Qualification object
#' @export
#'
#' @param qualification_type The id of the Qualification Type
#' @param worker The id of the Worker whose Qualification is being updated
#'
get_qualification_score <- function(
    qualification_type,
    worker
) {

  rlang::check_required(
    qualification_type,
    worker
  )

  assertthat::assert_that(
    assertthat::is.string(qualification_type),
    assertthat::is.string(worker)
  )

  b <- list(
    QualificationTypeId = qualification_type,
    WorkerId = worker
  )

  res <- mturkHTTP(
    action = "GetQualificationScore",
    body = b
  )
}
