#'
#' @title Delete HIT
#' @description Deletes a HIT
#' @return If successful, an empty body with no errors
#' @export
#'
#' @param id The id of the HIT
#'
delete_hit <- function(
    id
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
  )

  b <- list(
    HITId = id
  )

  res <- mturkHTTP(
    action = "DeleteHIT",
    body = b
  )
}
