#'
#' @title Get Assignment
#' @description Gets the Assignment
#' @return If successful, an Assignment object
#' @export
#'
#' @param id The id of the assignment you want to retrieve
#'
get_assignment <- function(
    id
  ) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    AssignmentId = id
  )

  res <- mturkHTTP(
    action = "GetAssignment",
    body = b
  )
}
