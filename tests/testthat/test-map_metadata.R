metadata <- map_metadata()

test_that("metadata is a data frame", {
    expect_equal(
        class(metadata) %>% sort,
        c("data.frame", "tbl", "tbl_df")
    )
})

test_that("metadata is unique within domain and key", {
    expect_equal(
        nrow(metadata),
        metadata %>% select(domain, text_key) %>% distinct %>% nrow
    )
})
