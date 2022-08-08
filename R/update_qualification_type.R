#'
#' @title Update Qualification Type
#' @description Modifies the attributes of an existing Qualification type, which is represented by a QualificationType data structure. Only the owner of a Qualification type can modify its attributes.
#' @return If successful, a Qualification Type object
#' @export
#'
#' @param id The id of the Qualification type to update.
#' @param retry_delay The amount of time, in seconds, that Workers must wait after requesting a Qualification of the specified Qualification type before they can retry the Qualification request
#' @param status The new status of the Qualification type - Active | Inactive
#' @param description The new description of the Qualification type.
#' @param test The questions for the Qualification test a Worker must answer correctly to obtain a Qualification of this type. If this parameter is specified, TestDurationInSeconds must also be specified.
#' @param answer_key The answers to the Qualification test specified in the Test parameter, in the form of an AnswerKey data structure.
#' @param test_duration The number of seconds the Worker has to complete the Qualification test, starting from the time the Worker requests the Qualification. This is required if the Test parameter is specified.
#' @param auto_granted Specifies whether requests for the Qualification type are granted immediately, without prompting the Worker with a Qualification test.
#' @param auto_granted_value The Qualification value to use for automatically granted Qualifications. This parameter is used only if the AutoGranted parameter is true.
#'
update_qualification_type <- function(
    id,
    retry_delay,
    status,
    description,
    test,
    answer_key,
    test_duration,
    auto_granted,
    auto_granted_value
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    QualificationTypeId = id,
    RetryDelayInSeconds = retry_delay,
    QualificationTypeStatus = status,
    Description = description,
    Test = test,
    AnswerKey = answer_key,
    TestDurationInSeconds = test_duration,
    AutoGranted = auto_granted,
    AutoGrantedValue = auto_granted_value
  )

  res <- mturkHTTP(
    action = "UpdateQualificationType",
    body = b
  )
}
