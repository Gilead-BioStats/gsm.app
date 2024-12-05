test_that("mod_ParticipantDetails_Server 'None' participant selection", {
  testServer(
    mod_ParticipantDetails_Server,
    args = list(
      id = "participantDetailsTest",
      fnFetchData = sample_fnFetchData,
      rctv_strSubjectID = reactiveVal("None")
    ),
    {
      expect_null(rctv_lParticipantData())

      rctv_strSubjectID("0008")
      expect_length(rctv_lParticipantData(), 10)

      rctv_strSubjectID("")
      expect_null(rctv_lParticipantData())

      rctv_strSubjectID("0010")
      expect_length(rctv_lParticipantData(), 10)

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
      fnFetchData = sample_fnFetchData,
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      expected_metadata_fields <- c(
        "SubjectID",
        "GroupID",
        "country",
        "subject_nsv",
        "enrollyn",
        "timeonstudy",
        "firstparticipantdate",
        "firstdosedate",
        "timeontreatment",
        "agerep",
        "sex",
        "race"
      )
      expected_data_tables <- c(
        "Adverse_Events",
        "Data_Changes",
        "Data_Entry",
        "Enrollment",
        "Lab",
        "Protocol_Deviations",
        "Queries",
        "SUBJ",
        "Study_Completion",
        "Treatment_Completion"
      )
      expected_domain_data_tables <- setdiff(expected_data_tables, "SUBJ")

      expect_length(rctv_lParticipantData(), 10)
      expect_named(rctv_lParticipantData(), expected_data_tables)
      expect_length(rctv_lParticipantMetadata(), 12)
      expect_named(
        rctv_lParticipantMetadata(),
        expected_metadata_fields
      )
      expect_length(rctv_lParticipantDomainData(), 9)
      expect_named(
        rctv_lParticipantDomainData(),
        expected_domain_data_tables
      )

      rctv_strSubjectID("0010")
      expect_length(rctv_lParticipantData(), 10)
      expect_named(rctv_lParticipantData(), expected_data_tables)
      expect_length(rctv_lParticipantMetadata(), 12)
      expect_named(
        rctv_lParticipantMetadata(),
        expected_metadata_fields
      )
      expect_length(rctv_lParticipantDomainData(), 9)
      expect_named(
        rctv_lParticipantDomainData(),
        expected_domain_data_tables
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
      fnFetchData = sample_fnFetchData,
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      # Check that the participant metadata UI is rendered correctly
      expect_cleaned_html(output$metadata$html, call = call)
    }
  )
})
