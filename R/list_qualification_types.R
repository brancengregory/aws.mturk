#'
#' @title List Qualification Types
#' @description Searches for Qualification types using the specified search query, and returns a list of Qualification types.
#' @return If successful, a list of Qualification Types
#' @export
#'
#' @param query A search term
#' @param must_be_requestable Specifies that only Qualification types that a user can request through the Amazon Mechanical Turk web site, such as by taking a Qualification test, are returned as results of the search. Some Qualification types, such as those assigned automatically by the system, cannot be requested directly by users. If false, all Qualification types, including those managed by the system, are considered for the search.
#' @param must_be_owned_by_caller Specifies that only Qualification types that the Requester created are returned. If false, the operation returns all Qualification types.
#' @param next_token Pagination token
#' @param max_results Maximum number of Qualification Types to return
#'
list_qualification_requests <- function(
    query,
    must_be_requestable,
    must_be_owned_by_caller,
    next_token,
    max_results
) {

  rlang::check_required(
    must_be_requestable
  )

  assertthat::assert_that(
    assertthat::is.flag(must_be_requestable)
  )

  b <- list(
    Query = query,
    MustBeRequestable = must_be_requestable,
    MustBeOwnedByCaller = must_be_owned_by_caller,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListQualificationTypes",
    body = b
  )
}
