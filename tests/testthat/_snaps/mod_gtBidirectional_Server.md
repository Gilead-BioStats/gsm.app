# mod_gtBidirectional_Server starts as expected and updates

    Code
      test_html
    Output
      [1] "<div id=\"gtRandID\" class=\".gt_table\" style=\"padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;\">\n  <style>#gtRandID table {\n  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale;\n}\n\n#gtRandID thead, #gtRandID tbody, #gtRandID tfoot, #gtRandID tr, #gtRandID td, #gtRandID th {\n  border-style: none;\n}\n\n#gtRandID p {\n  margin: 0;\n  padding: 0;\n}\n\n#gtRandID .gt_table {\n  display: table;\n  border-collapse: collapse;\n  line-height: normal;\n  margin-left: auto;\n  margin-right: auto;\n  color: #333333;\n  font-size: 16px;\n  font-weight: normal;\n  font-style: normal;\n  background-color: rgba(255, 255, 255, 0);\n  width: auto;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #A8A8A8;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #A8A8A8;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n}\n\n#gtRandID .gt_caption {\n  padding-top: 4px;\n  padding-bottom: 4px;\n}\n\n#gtRandID .gt_title {\n  color: #333333;\n  font-size: 125%;\n  font-weight: initial;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-color: rgba(255, 255, 255, 0);\n  border-bottom-width: 0;\n}\n\n#gtRandID .gt_subtitle {\n  color: #333333;\n  font-size: 85%;\n  font-weight: initial;\n  padding-top: 3px;\n  padding-bottom: 5px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-color: rgba(255, 255, 255, 0);\n  border-top-width: 0;\n}\n\n#gtRandID .gt_heading {\n  background-color: rgba(255, 255, 255, 0);\n  text-align: center;\n  border-bottom-color: rgba(255, 255, 255, 0);\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_bottom_border {\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_headings {\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_heading {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 6px;\n  padding-left: 5px;\n  padding-right: 5px;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_column_spanner_outer {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  padding-top: 0;\n  padding-bottom: 0;\n  padding-left: 4px;\n  padding-right: 4px;\n}\n\n#gtRandID .gt_column_spanner_outer:first-child {\n  padding-left: 0;\n}\n\n#gtRandID .gt_column_spanner_outer:last-child {\n  padding-right: 0;\n}\n\n#gtRandID .gt_column_spanner {\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 5px;\n  overflow-x: hidden;\n  display: inline-block;\n  width: 100%;\n}\n\n#gtRandID .gt_spanner_row {\n  border-bottom-style: hidden;\n}\n\n#gtRandID .gt_group_heading {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  text-align: left;\n}\n\n#gtRandID .gt_empty_group_heading {\n  padding: 0.5px;\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: middle;\n}\n\n#gtRandID .gt_from_md > :first-child {\n  margin-top: 0;\n}\n\n#gtRandID .gt_from_md > :last-child {\n  margin-bottom: 0;\n}\n\n#gtRandID .gt_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  margin: 10px;\n  border-top-style: solid;\n  border-top-width: 1px;\n  border-top-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_stub {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: solid;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_stub_row_group {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: solid;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n  vertical-align: top;\n}\n\n#gtRandID .gt_row_group_first td {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_row_group_first th {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_summary_row {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_summary_row {\n  border-top-style: solid;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_first_summary_row.thick {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_last_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_grand_summary_row {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_grand_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-style: double;\n  border-top-width: 6px;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_last_grand_summary_row_top {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: double;\n  border-bottom-width: 6px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_striped {\n  background-color: rgba(128, 128, 128, 0.05);\n}\n\n#gtRandID .gt_table_body {\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnotes {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnote {\n  margin: 0px;\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_sourcenotes {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_sourcenote {\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_left {\n  text-align: left;\n}\n\n#gtRandID .gt_center {\n  text-align: center;\n}\n\n#gtRandID .gt_right {\n  text-align: right;\n  font-variant-numeric: tabular-nums;\n}\n\n#gtRandID .gt_font_normal {\n  font-weight: normal;\n}\n\n#gtRandID .gt_font_bold {\n  font-weight: bold;\n}\n\n#gtRandID .gt_font_italic {\n  font-style: italic;\n}\n\n#gtRandID .gt_super {\n  font-size: 65%;\n}\n\n#gtRandID .gt_footnote_marks {\n  font-size: 75%;\n  vertical-align: 0.4em;\n  position: initial;\n}\n\n#gtRandID .gt_asterisk {\n  font-size: 100%;\n  vertical-align: 0;\n}\n\n#gtRandID .gt_indent_1 {\n  text-indent: 5px;\n}\n\n#gtRandID .gt_indent_2 {\n  text-indent: 10px;\n}\n\n#gtRandID .gt_indent_3 {\n  text-indent: 15px;\n}\n\n#gtRandID .gt_indent_4 {\n  text-indent: 20px;\n}\n\n#gtRandID .gt_indent_5 {\n  text-indent: 25px;\n}\n\n#gtRandID .katex-display {\n  display: inline-flex !important;\n  margin-bottom: 0.75em !important;\n}\n\n#gtRandID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {\n  height: 0px !important;\n}\n</style>\n  <div id=\"gtRandID\" class=\"reactable html-widget\" style=\"width:auto;height:auto;\"></div>\n  <script type=\"application/json\" data-for=\"gtRandID\">{\"x\":{\"tag\":{\"name\":\"Reactable\",\"attribs\":{\"data\":{\"a\":[1,2,3],\"b\":[4,5,6]},\"columns\":[{\"id\":\".selection\",\"name\":\"\",\"type\":null,\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"resizable\":false,\"width\":45,\"selectable\":true},{\"id\":\"a\",\"name\":\"a\",\"type\":\"numeric\",\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"html\":true,\"align\":\"right\"},{\"id\":\"b\",\"name\":\"b\",\"type\":\"numeric\",\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"html\":true,\"align\":\"right\"}],\"resizable\":true,\"defaultPageSize\":10,\"showPageSizeOptions\":true,\"pageSizeOptions\":[10,25,50,100],\"paginationType\":\"numbers\",\"showPagination\":true,\"showPageInfo\":true,\"minRows\":1,\"selection\":\"single\",\"onClick\":\"select\",\"highlight\":true,\"striped\":true,\"compact\":true,\"nowrap\":true,\"height\":\"auto\",\"theme\":{\"color\":\"#333333\",\"backgroundColor\":\"transparent\",\"stripedColor\":\"rgba(128,128,128,0.05)\",\"style\":{\"font-family\":\"system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif\",\"fontSize\":\"16px\"},\"tableStyle\":{\"borderTopStyle\":\"solid\",\"borderTopWidth\":\"2px\",\"borderTopColor\":\"#D3D3D3\"},\"headerStyle\":{\"fontWeight\":\"normal\",\"backgroundColor\":\"transparent\",\"borderBottomStyle\":\"solid\",\"borderBottomWidth\":\"2px\",\"borderBottomColor\":\"#D3D3D3\"},\"groupHeaderStyle\":{\"fontWeight\":\"normal\",\"backgroundColor\":\"transparent\",\"borderBottomStyle\":\"solid\",\"borderBottomWidth\":\"2px\",\"borderBottomColor\":\"#D3D3D3\"},\"cellStyle\":{\"fontWeight\":\"normal\"}},\"elementId\":\"gtRandID\",\"dataKey\":\"9c92c5c24f8c2c7d92cfbc7d2f955777\"},\"children\":[]},\"class\":\"reactR_markup\"},\"evals\":[\"tag.attribs.columns.0.style\",\"tag.attribs.columns.1.style\",\"tag.attribs.columns.2.style\"],\"jsHooks\":[]}</script>\n</div>\n<script>gtShinyBinding.initialize('testinggtBidrect-table');</script>"

---

    Code
      test_html
    Output
      [1] "<div id=\"gtRandID\" class=\".gt_table\" style=\"padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;\">\n  <style>#gtRandID table {\n  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale;\n}\n\n#gtRandID thead, #gtRandID tbody, #gtRandID tfoot, #gtRandID tr, #gtRandID td, #gtRandID th {\n  border-style: none;\n}\n\n#gtRandID p {\n  margin: 0;\n  padding: 0;\n}\n\n#gtRandID .gt_table {\n  display: table;\n  border-collapse: collapse;\n  line-height: normal;\n  margin-left: auto;\n  margin-right: auto;\n  color: #333333;\n  font-size: 16px;\n  font-weight: normal;\n  font-style: normal;\n  background-color: rgba(255, 255, 255, 0);\n  width: auto;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #A8A8A8;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #A8A8A8;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n}\n\n#gtRandID .gt_caption {\n  padding-top: 4px;\n  padding-bottom: 4px;\n}\n\n#gtRandID .gt_title {\n  color: #333333;\n  font-size: 125%;\n  font-weight: initial;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-color: rgba(255, 255, 255, 0);\n  border-bottom-width: 0;\n}\n\n#gtRandID .gt_subtitle {\n  color: #333333;\n  font-size: 85%;\n  font-weight: initial;\n  padding-top: 3px;\n  padding-bottom: 5px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-color: rgba(255, 255, 255, 0);\n  border-top-width: 0;\n}\n\n#gtRandID .gt_heading {\n  background-color: rgba(255, 255, 255, 0);\n  text-align: center;\n  border-bottom-color: rgba(255, 255, 255, 0);\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_bottom_border {\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_headings {\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_heading {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 6px;\n  padding-left: 5px;\n  padding-right: 5px;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_column_spanner_outer {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  padding-top: 0;\n  padding-bottom: 0;\n  padding-left: 4px;\n  padding-right: 4px;\n}\n\n#gtRandID .gt_column_spanner_outer:first-child {\n  padding-left: 0;\n}\n\n#gtRandID .gt_column_spanner_outer:last-child {\n  padding-right: 0;\n}\n\n#gtRandID .gt_column_spanner {\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 5px;\n  overflow-x: hidden;\n  display: inline-block;\n  width: 100%;\n}\n\n#gtRandID .gt_spanner_row {\n  border-bottom-style: hidden;\n}\n\n#gtRandID .gt_group_heading {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  text-align: left;\n}\n\n#gtRandID .gt_empty_group_heading {\n  padding: 0.5px;\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: middle;\n}\n\n#gtRandID .gt_from_md > :first-child {\n  margin-top: 0;\n}\n\n#gtRandID .gt_from_md > :last-child {\n  margin-bottom: 0;\n}\n\n#gtRandID .gt_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  margin: 10px;\n  border-top-style: solid;\n  border-top-width: 1px;\n  border-top-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_stub {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: solid;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_stub_row_group {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: solid;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n  vertical-align: top;\n}\n\n#gtRandID .gt_row_group_first td {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_row_group_first th {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_summary_row {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_summary_row {\n  border-top-style: solid;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_first_summary_row.thick {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_last_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_grand_summary_row {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_grand_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-style: double;\n  border-top-width: 6px;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_last_grand_summary_row_top {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: double;\n  border-bottom-width: 6px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_striped {\n  background-color: rgba(128, 128, 128, 0.05);\n}\n\n#gtRandID .gt_table_body {\n  border-top-style: solid;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: solid;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnotes {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnote {\n  margin: 0px;\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_sourcenotes {\n  color: #333333;\n  background-color: rgba(255, 255, 255, 0);\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_sourcenote {\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_left {\n  text-align: left;\n}\n\n#gtRandID .gt_center {\n  text-align: center;\n}\n\n#gtRandID .gt_right {\n  text-align: right;\n  font-variant-numeric: tabular-nums;\n}\n\n#gtRandID .gt_font_normal {\n  font-weight: normal;\n}\n\n#gtRandID .gt_font_bold {\n  font-weight: bold;\n}\n\n#gtRandID .gt_font_italic {\n  font-style: italic;\n}\n\n#gtRandID .gt_super {\n  font-size: 65%;\n}\n\n#gtRandID .gt_footnote_marks {\n  font-size: 75%;\n  vertical-align: 0.4em;\n  position: initial;\n}\n\n#gtRandID .gt_asterisk {\n  font-size: 100%;\n  vertical-align: 0;\n}\n\n#gtRandID .gt_indent_1 {\n  text-indent: 5px;\n}\n\n#gtRandID .gt_indent_2 {\n  text-indent: 10px;\n}\n\n#gtRandID .gt_indent_3 {\n  text-indent: 15px;\n}\n\n#gtRandID .gt_indent_4 {\n  text-indent: 20px;\n}\n\n#gtRandID .gt_indent_5 {\n  text-indent: 25px;\n}\n\n#gtRandID .katex-display {\n  display: inline-flex !important;\n  margin-bottom: 0.75em !important;\n}\n\n#gtRandID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {\n  height: 0px !important;\n}\n</style>\n  <div id=\"gtRandID\" class=\"reactable html-widget\" style=\"width:auto;height:auto;\"></div>\n  <script type=\"application/json\" data-for=\"gtRandID\">{\"x\":{\"tag\":{\"name\":\"Reactable\",\"attribs\":{\"data\":{\"a\":[1,2,3],\"b\":[4,5,6]},\"columns\":[{\"id\":\".selection\",\"name\":\"\",\"type\":null,\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"resizable\":false,\"width\":45,\"selectable\":true},{\"id\":\"a\",\"name\":\"a\",\"type\":\"numeric\",\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"html\":true,\"align\":\"right\"},{\"id\":\"b\",\"name\":\"b\",\"type\":\"numeric\",\"na\":\"NA\",\"minWidth\":125,\"style\":\"function(rowInfo, colInfo) {\\nconst rowIndex = rowInfo.index + 1\\n}\",\"html\":true,\"align\":\"right\"}],\"resizable\":true,\"defaultPageSize\":10,\"showPageSizeOptions\":true,\"pageSizeOptions\":[10,25,50,100],\"paginationType\":\"numbers\",\"showPagination\":true,\"showPageInfo\":true,\"minRows\":1,\"selection\":\"single\",\"onClick\":\"select\",\"highlight\":true,\"striped\":true,\"compact\":true,\"nowrap\":true,\"height\":\"auto\",\"theme\":{\"color\":\"#333333\",\"backgroundColor\":\"transparent\",\"stripedColor\":\"rgba(128,128,128,0.05)\",\"style\":{\"font-family\":\"system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif\",\"fontSize\":\"16px\"},\"tableStyle\":{\"borderTopStyle\":\"solid\",\"borderTopWidth\":\"2px\",\"borderTopColor\":\"#D3D3D3\"},\"headerStyle\":{\"fontWeight\":\"normal\",\"backgroundColor\":\"transparent\",\"borderBottomStyle\":\"solid\",\"borderBottomWidth\":\"2px\",\"borderBottomColor\":\"#D3D3D3\"},\"groupHeaderStyle\":{\"fontWeight\":\"normal\",\"backgroundColor\":\"transparent\",\"borderBottomStyle\":\"solid\",\"borderBottomWidth\":\"2px\",\"borderBottomColor\":\"#D3D3D3\"},\"cellStyle\":{\"fontWeight\":\"normal\"}},\"elementId\":\"gtRandID\",\"dataKey\":\"9c92c5c24f8c2c7d92cfbc7d2f955777\"},\"children\":[]},\"class\":\"reactR_markup\"},\"evals\":[\"tag.attribs.columns.0.style\",\"tag.attribs.columns.1.style\",\"tag.attribs.columns.2.style\"],\"jsHooks\":[]}</script>\n</div>\n<script>gtShinyBinding.initialize('testinggtBidrect-table');</script>"
