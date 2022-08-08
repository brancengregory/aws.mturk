#'
#' @title List Worker Blocks
#' @description Retrieves a list of Workers who are blocked from working on your HITs.
#' @return If successful, a list of Workers that have been blocked along with the reason for the block.
#' @export
#'
#' @param next_token Pagination token
#' @param max_results Maximum number of Workers to return
#'
list_worker_blocks <- function(
    next_token,
    max_results
) {

  rlang::check_required(
  )

  assertthat::assert_that(

  )

  b <- list(
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListWorkerBlocks",
    body = b
  )
}
