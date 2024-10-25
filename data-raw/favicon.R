favicon_base64 <- fontawesome::fa("angles-up", fill = colorScheme("red")) %>%
  magick::image_read_svg(width = 32, height = 32) %>%
  magick::image_write(format = "png") %>%
  base64enc::base64encode()
favicon_url <- paste0("data:image/png;base64,", favicon_base64)
usethis::use_data(favicon_url, overwrite = TRUE)
