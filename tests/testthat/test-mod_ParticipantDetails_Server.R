test_that("mod_ParticipantDetails_Server 'None' participant selection", {
  testServer(
    mod_ParticipantDetails_Server,
    args = list(
      id = "participantDetailsTest",
      fnFetchParticipantData = sample_FetchParticipantData,
      rctv_strSubjectID = reactiveVal("None")
    ),
    {
      expect_null(rctv_lParticipantData())

      rctv_strSubjectID("0008")
      expect_length(rctv_lParticipantData(), 2)

      rctv_strSubjectID("")
      expect_null(rctv_lParticipantData())

      rctv_strSubjectID("0010")
      expect_length(rctv_lParticipantData(), 2)

      rctv_strSubjectID(NULL)
      expect_null(rctv_lParticipantData())
    }
  )
})

test_that("mod_ParticipantDetails_Server fetches participant data", {
  testServer(
    mod_ParticipantDetails_Server,
    args = list(
      id = "participantDetailsTest",
      fnFetchParticipantData = sample_FetchParticipantData,
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      expected_metadata_fields <- c(
        "SubjectID",
        "enrolled",
        "study_start_date",
        "days_on_study",
        "treatment_start_date",
        "days_on_treatment",
        "age",
        "sex",
        "race",
        "ethnicity"
      )
      expected_metric_data_tables <- c(
        "AdverseEvents",
        "DataEntry",
        "Enrollment",
        "Lab",
        "ProtocolDeviations",
        "Queries",
        "StudyCompletion",
        "TreatmentCompletion"
      )

      expect_length(rctv_lParticipantData(), 2)
      expect_named(rctv_lParticipantData(), c("metadata", "metric_data"))
      expect_length(rctv_lParticipantMetadata(), 10)
      expect_named(
        rctv_lParticipantMetadata(),
        expected_metadata_fields
      )
      expect_length(rctv_lParticipantMetricData(), 8)
      expect_named(
        rctv_lParticipantMetricData(),
        expected_metric_data_tables
      )

      rctv_strSubjectID("0010")
      expect_length(rctv_lParticipantData(), 2)
      expect_named(rctv_lParticipantData(), c("metadata", "metric_data"))
      expect_length(rctv_lParticipantMetadata(), 10)
      expect_named(
        rctv_lParticipantMetadata(),
        expected_metadata_fields
      )
      expect_length(rctv_lParticipantMetricData(), 8)
      expect_named(
        rctv_lParticipantMetricData(),
        expected_metric_data_tables
      )
    }
  )
})

test_that("mod_ParticipantDetails_Server outputs the expected result", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDetails_Server,
    args = list(
      id = "participantDetailsTest",
      fnFetchParticipantData = sample_FetchParticipantData,
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      # Check that the participant metadata UI is rendered correctly
      expect_cleaned_html(output$metadata$html, call = call)
    }
  )
})

test_that("mod_ParticipantDetails_Server returns the selected rows", {
  testServer(
    mod_ParticipantDetails_Server,
    args = list(
      id = "participantDetailsTest",
      fnFetchParticipantData = sample_FetchParticipantData,
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      rctv_intSelectedRows <- session$getReturned()
      expect_s3_class(rctv_intSelectedRows, "reactive")
      expect_null(rctv_intSelectedRows())

      # Simulate selecting rows in the participant domain table
      session$setInputs(`domain-table_rows_selected` = 1L)
      expect_equal(rctv_intSelectedRows(), 1L)
      session$setInputs(`domain-table_rows_selected` = 1:3)
      expect_equal(rctv_intSelectedRows(), 1:3)
      session$setInputs(`domain-table_rows_selected` = 5:6)
      expect_equal(rctv_intSelectedRows(), 5:6)
      session$setInputs(`domain-table_rows_selected` = integer())
      expect_equal(rctv_intSelectedRows(), integer())
    }
  )
})
