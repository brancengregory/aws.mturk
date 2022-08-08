#'
#' @title Reject Assignment
#' @description Rejects the results of a completed assignment.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The id of the assignment
#' @param feedback A message for the Worker, which the Worker can see in the Status section of the web site.
#'
reject_assignment <- function(
    id,
    feedback
) {

  rlang::check_required(
    id,
    feedback
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.string(feedback)
  )

  b <- list(
    AssignmentId = id,
    RequesterFeedback = feedback
  )

  res <- mturkHTTP(
    action = "RejectAssignment",
    body = b
  )
}
