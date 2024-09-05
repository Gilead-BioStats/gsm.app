mod_ActionList_UI = function(id, chrNames, chrLabels, intCounts) {
  ns <- NS(id)
  links <- purrr::map2(
    chrNames,
    chrLabels,
    function(strName, strLabel) {
      actionLink(ns(strName), label = strLabel)
    }
  )
  out_MetadataList(chrLabels = links, chrValues = intCounts)
}
