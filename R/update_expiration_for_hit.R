#'
#' @title Update Expiration for HIT
#' @description Allows you extend the expiration time of a HIT beyond is current expiration or expire a HIT immediately. You cannot shorten the expiration time so that you're not affecting Workers who have accepted your HIT.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The HIT to update
#' @param expire_at The date and time at which you want the HIT to expire
#'
update_expiration_for_hit <- function(
    id,
    expire_at
) {

  rlang::check_required(
    id,
    expire_at
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.time(expire_at)
  )

  b <- list(
    HITId = id,
    ExpireAt = expire_at
  )

  res <- mturkHTTP(
    action = "UpdateExpirationForHIT",
    body = b
  )
}
