#'
#' @title List HITs
#' @description Lists all of a Requester's HITs. The operation returns HITs of any status, except for HITs that have been deleted of with the DeleteHIT operation or that have been auto-deleted
#' @return If successful, a list of HIT objects
#' @export
#'
#' @param next_token Pagination token
#' @param max_results Maximum number of Assignments to return
#'
list_hits <- function(
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
    action = "ListHITs",
    body = b
  )
}
