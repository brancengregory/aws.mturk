#'
#' @title Get Account Balance
#' @description Gets the Account Balance
#' @return If successful, a string representing your available balance details in U.S. Dollars
#' @export
#'
get_account_balance <- function() {

  b <- list()

  res <- mturkHTTP(
    action = "GetAccountBalance",
    body = b
  )
}
