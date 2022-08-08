#'
#' @title Create Worker Block
#' @description Blocks a Worker from working on your HITs
#' @return If successful, an empty body with no errors
#' @export
#'
#' @param id The id of the worker to block
#' @param reason A message that explains the reason for blocking the Worker. The Worker does not see this message
#'
create_worker_block <- function(
    id,
    reason
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
  )

  b <- list(
    WorkerId = id,
    Reason = reason
  )

  res <- mturkHTTP(
    action = "CreateWorkerBlock",
    body = b
  )
}
