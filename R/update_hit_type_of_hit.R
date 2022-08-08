#'
#' @title Update HIT Type of HIT
#' @description Changes the HITType properties of a HIT
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The HIT to update
#' @param type The id of the new HIT type
#'
update_hit_type_of_hit <- function(
    id,
    type
) {

  rlang::check_required(
    id,
    type
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.string(type)
  )

  b <- list(
    HITId = id,
    HITTypeId = type
  )

  res <- mturkHTTP(
    action = "UpdateHITTypeOfHIT",
    body = b
  )
}
