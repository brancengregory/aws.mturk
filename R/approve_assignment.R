#' @title Approve Assignment
#' @description Approves an assignment
#' @return If successful, empty body and no errors.
#' @export
#'
#' @param id The id of the assignment. This parameter must correspond to a HIT created by the Requester.
#' @param feedback A message for the Worker, which the Worker can see in the Status section of the web site.
#' @param ... Placeholder for future arguments
#' @param .override A flag indicating whether you want to approve an assignment that was previously rejected.
#'
approve_assignment <- function(id, feedback, ..., .override = F) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    AssignmentId = id,
    RequesterFeedback = feedback,
    OverrideRejection = .override
  )

  res <- mturkHTTP(
    action = "ApproveAssignment",
    body = b
  )
}
