test_that("mod_ScatterPlotSet_UI creates the expected UI", {
  expect_cleaned_html({
    mod_ScatterPlotSet_UI("myID", c(mod1 = "a", mod2 = "b", mod3 = "c"))
  })
})
