#'
#' @title Get HIT
#' @description Gets a HIT
#' @return If successful, a HIT object
#' @export
#'
#' @param id The id of the HIT
#'
get_hit <- function(
    id
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
  )

  b <- list(
    HITId = id,
  )

  res <- mturkHTTP(
    action = "GetHIT",
    body = b
  )
}
