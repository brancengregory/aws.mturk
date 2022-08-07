#' @title Approve Assignment
#' @description Approves an assignment
#' @return If successful, Empty body and no errors.
#' @export
approve_assignment <- function(id, message, ..., .override = F) {
  if(!is.character(id) | !is.character(message) | !is.logical(.override)) {
    stop("`id` and `message` must be a character vectors, and `.override` must be a logical")
  }

  b <- list(
    AssignmentId = id,
    RequesterFeedback = message,
    OverrideRejection = .override
  )

  res <- mturkHTTP(
    action = "ApproveAssignment",
    body = b
  )
}
