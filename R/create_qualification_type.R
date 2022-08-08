#'
#' @title Create Qualification Type
#' @description Creates a Qualification Type
#' @return If successful, a Qualification Type object.
#' @export
#'
#' @param name The name to be given to the Qualification type
#' @param description A long description for the Qualification type
#' @param keywords One or more words or phrases that describe the Qualification type
#' @param retry_delay The number of seconds that a Worker must wait after requesting a Qualification of the Qualification type before the worker can retry the Qualification request
#' @param qualification_type_status The initial status of the Qualification type
#' @param test The questions for the Qualification test a Worker must answer correctly to obtain a Qualification of this type; if this parameter is specified, `test_duration` must also be specified
#' @param answer_key The answers to the Qualification test specified in the Test parameter
#' @param test_duration The number of seconds the Worker has to complete the Qualification test, starting from the time the Worker requests the Qualification
#' @param auto_granted Specifies whether requests for the Qualification type are granted immediately, without prompting the Worker with a Qualification test
#' @param auto_granted_value The Qualification value to use for automatically granted Qualifications. This parameter is used only if the `auto_granted` parameter is true.
#'
create_qualification_type <- function(
    name,
    description,
    keywords,
    retry_delay,
    qualification_type_status,
    test,
    answer_key,
    test_duration,
    auto_granted,
    auto_granted_value
) {

  rlang::check_required(
    name,
    description,
    qualification_type_status
  )

  assertthat::assert_that(
    assertthat::is.string(name),
    assertthat::is.string(description),
    assertthat::is.string(qualification_type_status)
  )

  b <- list(
    Name = name,
    Description = description,
    Keywords = keywords,
    RetryDelayInSeconds = retry_delay,
    QualificationTypeStatus = qualification_type_status,
    Test = test,
    AnswerKey = answer_key,
    TestDurationInSeconds = test_duration,
    AutoGranted = auto_granted,
    AutoGrantedValue = auto_granted_value
  )

  res <- mturkHTTP(
    action = "CreateQualificationType",
    body = b
  )
}
