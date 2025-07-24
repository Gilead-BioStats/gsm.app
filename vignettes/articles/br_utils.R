read_brs <- function(path) {
  purrr::map_depth(yaml::read_yaml(path), 2, stringr::str_squish)
}

write_brs <- function(brs, path) {
  brs |>
    purrr::map(
      \(this_group) {
        purrr::map(
          this_group,
          \(this_br) {
            paste0(stringr::str_squish(this_br), "\n")
          }
        )
      }
    ) |>
    yaml::as.yaml() |>
    stringr::str_split_1("\n") |>
    stringr::str_subset(".") |>
    purrr::map(\(this_line) {
      if (nchar(this_line) <= 80) {
        return(this_line)
      }
      pieces <- stringr::str_split_1(stringr::str_trim(this_line), "\\s+")
      n <- 1L
      to_return <- list("   ")
      for (piece in pieces) {
        new_chunk <- paste(to_return[[n]], piece)
        if (nchar(new_chunk) < 80) {
          to_return[[n]] <- new_chunk
        } else {
          n <- n + 1L
          to_return[[n]] <- paste("   ", piece)
        }
      }
      return(to_return)
    }) |>
    unlist() |>
    writeLines(path)
}

extract_br_abbrs <- function(brs) {
  purrr::map_chr(brs, \(br) {
    stringr::str_extract(names(br)[[1]], "BR-([^-]+)", 1)
  })
}

read_br_imgs <- function(testthat_path = "../../tests/testthat") {
  imgs <- as.character(fs::dir_ls(
    fs::path(testthat_path, "_snaps", "br"),
    recurse = TRUE,
    type = "file"
  ))
  img_brs <- toupper(
    stringr::str_extract(
      fs::path_file(imgs), "^br-[^-]+-\\d+"
    )
  )
  imgs_name1 <- split(imgs, img_brs)
  br_abbrs <- stringr::str_extract(img_brs, "^BR-([^-]+)", 1)
  purrr::map(
    split(img_brs, br_abbrs),
    function(br_set) {
      imgs_name1[unique(br_set)]
    }
  )
}
