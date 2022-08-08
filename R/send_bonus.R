#'
#' @title Send Bonus
#' @description Issues a payment of money from your account to a Worker. This payment happens separately from the reward you pay to the Worker when you approve the Worker's assignment.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param worker The id of the Worker being paid the bonus
#' @param assignment The id of the assignment for which this bonus is paid.
#' @param amount The bonus, specified as a US Dollar amount.
#' @param reason A message that explains the reason for the bonus payment. The Worker receiving the bonus can see this message.
#' @param .token A unique identifier for this request, which allows you to retry the call on error without granting multiple bonuses
#'
send_bonus <- function(
    worker,
    assignment,
    amount,
    reason,
    .token
) {

  rlang::check_required(
    worker,
    assignment,
    amount,
    reason
  )

  assertthat::assert_that(
    assertthat::is.string(worker),
    assertthat::is.string(assignment),
    assertthat::is.string(amount),
    assertthat::is.string(reason)
  )

  b <- list(
    WorkerId = worker,
    AssignmentId = assignment,
    BonusAmount = amount,
    Reason = reason,
    UniqueRequestToken = .token
  )

  res <- mturkHTTP(
    action = "SendBonus",
    body = b
  )
}
