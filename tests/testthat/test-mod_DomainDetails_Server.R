test_that("mod_DomainDetails_Server 'All' participant selection", {
  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      fnFetchData = sample_fnFetchData,
      rctv_strSiteID = reactiveVal("None"),
      rctv_strSubjectID = reactiveVal("All")
    ),
    {
      expect_null(rctv_lDomainData())

      rctv_strSubjectID("0008")
      expect_length(rctv_lDomainData(), 10)

      rctv_strSubjectID("")
      expect_null(rctv_lDomainData())

      rctv_strSubjectID("0010")
      expect_length(rctv_lDomainData(), 10)

      rctv_strSubjectID(NULL)
      expect_null(rctv_lDomainData())
    }
  )
})

test_that("mod_DomainDetails_Server fetches participant data", {
  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      fnFetchData = sample_fnFetchData,
      rctv_strSiteID = reactiveVal("0X103"),
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
        "Study_Completion",
        "Subject_Metadata",
        "Treatment_Completion"
      )
      expect_length(rctv_lDomainData(), 10)
      expect_named(rctv_lDomainData(), expected_data_tables)

      rctv_strSubjectID("0010")
      expect_length(rctv_lDomainData(), 10)
      expect_named(rctv_lDomainData(), expected_data_tables)
    }
  )
})
