#'
#' @title Delete Worker Block
#' @description Unblocks a Worker
#' @return If successful, empty body and no errors
#' @export
#'
#' @param id The id of the Worker to unblock
#' @param reason A message that explains the reason for unblocking the Worker. The Worker does not see this message.
#'
delete_worker_block <- function(
    id,
    reason
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    WorkerId = id,
    Reason = reason
  )

  res <- mturkHTTP(
    action = "DeleteWorkerBlock",
    body = b
  )
}
