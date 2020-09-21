test_that("download_csl get the file", {
  download_csl("ecology")
  expect_true(file.exists("ecology.csl"))
  unlink("ecology.csl")
})
