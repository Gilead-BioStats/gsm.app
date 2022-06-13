metadata <- map_metadata()

test_that("a {safetyGraphics} chart object is returned", {
    assessment <- prepare_assessment(
        metadata,
        assessment = list(
            domain_name = 'AE',
            map_function = 'AE_Map_Raw',
            assess_function = 'AE_Assess'
        )
    )

    expect_equal(
        names(assessment) %>% sort,
        c('domain', 'env', 'envValid', 'export', 'functions', 'label', 'meta', 'name', 'order', 'type', 'workflow')
    )
})
