# mod_DomainData_UI creates the expected UI

    Code
      test_result
    Output
      <div class="tab-pane" title="Adverse Events" data-value="AE">
        <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div>
              <style>#myDomain-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="myDomain-prevalence_plot-card">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div id="myDomain-prevalence_plot-title">
                    <span id="myDomain-prevalence_plot-category-select" class="inline-select">
                      <div class="form-group shiny-input-container shiny-input-container-inline">
                        <label class="control-label shiny-label-null" for="myDomain-prevalence_plot-category-select-select" id="myDomain-prevalence_plot-category-select-select-label"></label>
                        <div id="myDomain-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
                          <script type="application/json" data-for="myDomain-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                        </div>
                      </div>
                    </span>
                    <span id="myDomain-prevalence_plot-key" class="label-key-container">
                      by
                      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                        <label class="control-label shiny-label-null" for="myDomain-prevalence_plot-key-Study" id="myDomain-prevalence_plot-key-Study-label"></label>
                        <div id="myDomain-prevalence_plot-key-Study" class="checkbox-group-buttons">
                          <div aria-labelledby="myDomain-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                            <div class="btn-group btn-group-toggle" role="group">
                              <button class="btn checkbtn btn-label-key-study">
                                <input type="checkbox" autocomplete="off" name="myDomain-prevalence_plot-key-Study" value="Study"/>
                                Study
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                        <label class="control-label shiny-label-null" for="myDomain-prevalence_plot-key-Group" id="myDomain-prevalence_plot-key-Group-label"></label>
                        <div id="myDomain-prevalence_plot-key-Group" class="checkbox-group-buttons">
                          <div aria-labelledby="myDomain-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                            <div class="btn-group btn-group-toggle" role="group">
                              <button class="btn checkbtn btn-label-key-group">
                                <input type="checkbox" autocomplete="off" name="myDomain-prevalence_plot-key-Group" value="Group"/>
                                Group
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                        <label class="control-label shiny-label-null" for="myDomain-prevalence_plot-key-Participant" id="myDomain-prevalence_plot-key-Participant-label"></label>
                        <div id="myDomain-prevalence_plot-key-Participant" class="checkbox-group-buttons">
                          <div aria-labelledby="myDomain-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                            <div class="btn-group btn-group-toggle" role="group">
                              <button class="btn checkbtn btn-label-key-participant">
                                <input type="checkbox" autocomplete="off" name="myDomain-prevalence_plot-key-Participant" value="Participant"/>
                                Participant
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <bslib-tooltip id="myDomain-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
                      </bslib-tooltip>
                    </span>
                  </div>
                  <div class="shiny-plot-output html-fill-item" id="myDomain-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div>
              <style>#myDomain-card .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="myDomain-card">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div data-spinner-id="myDomain-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                    <div class="load-container shiny-spinner-hidden load7">
                      <div id="myDomain-spinner" class="loader">Loading...</div>
                      <div id="myDomain-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                    </div>
                    <div style="height:200px" class="shiny-spinner-placeholder"></div>
                    <div class="shiny-html-output gt_shiny" id="myDomain-gt-table"></div>
                  </div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
        </bslib-layout-columns>
      </div>

# mod_DomainData_Server sets placeholder when no data is available

    Code
      test_html
    Output
      [1] "<div id=\"gtRandID\" style=\"padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;\">\n  <style>#gtRandID table {\n  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale;\n}\n\n#gtRandID thead, #gtRandID tbody, #gtRandID tfoot, #gtRandID tr, #gtRandID td, #gtRandID th {\n  border-style: none;\n}\n\n#gtRandID p {\n  margin: 0;\n  padding: 0;\n}\n\n#gtRandID .gt_table {\n  display: table;\n  border-collapse: collapse;\n  line-height: normal;\n  margin-left: auto;\n  margin-right: auto;\n  color: #333333;\n  font-size: 16px;\n  font-weight: normal;\n  font-style: normal;\n  background-color: #81E3F3;\n  width: auto;\n  border-top-style: none;\n  border-top-width: 2px;\n  border-top-color: #A8A8A8;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #A8A8A8;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n}\n\n#gtRandID .gt_caption {\n  padding-top: 4px;\n  padding-bottom: 4px;\n}\n\n#gtRandID .gt_title {\n  color: #333333;\n  font-size: 125%;\n  font-weight: initial;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-color: #81E3F3;\n  border-bottom-width: 0;\n}\n\n#gtRandID .gt_subtitle {\n  color: #333333;\n  font-size: 85%;\n  font-weight: initial;\n  padding-top: 3px;\n  padding-bottom: 5px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-color: #81E3F3;\n  border-top-width: 0;\n}\n\n#gtRandID .gt_heading {\n  background-color: #81E3F3;\n  text-align: center;\n  border-bottom-color: #81E3F3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_bottom_border {\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_headings {\n  border-top-style: none;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_col_heading {\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 6px;\n  padding-left: 5px;\n  padding-right: 5px;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_column_spanner_outer {\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: normal;\n  text-transform: inherit;\n  padding-top: 0;\n  padding-bottom: 0;\n  padding-left: 4px;\n  padding-right: 4px;\n}\n\n#gtRandID .gt_column_spanner_outer:first-child {\n  padding-left: 0;\n}\n\n#gtRandID .gt_column_spanner_outer:last-child {\n  padding-right: 0;\n}\n\n#gtRandID .gt_column_spanner {\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: bottom;\n  padding-top: 5px;\n  padding-bottom: 5px;\n  overflow-x: hidden;\n  display: inline-block;\n  width: 100%;\n}\n\n#gtRandID .gt_spanner_row {\n  border-bottom-style: hidden;\n}\n\n#gtRandID .gt_group_heading {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-top-style: none;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  text-align: left;\n}\n\n#gtRandID .gt_empty_group_heading {\n  padding: 0.5px;\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: initial;\n  border-top-style: none;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  vertical-align: middle;\n}\n\n#gtRandID .gt_from_md > :first-child {\n  margin-top: 0;\n}\n\n#gtRandID .gt_from_md > :last-child {\n  margin-bottom: 0;\n}\n\n#gtRandID .gt_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  margin: 10px;\n  border-top-style: none;\n  border-top-width: 1px;\n  border-top-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 1px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 1px;\n  border-right-color: #D3D3D3;\n  vertical-align: middle;\n  overflow-x: hidden;\n}\n\n#gtRandID .gt_stub {\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_stub_row_group {\n  color: #333333;\n  background-color: #81E3F3;\n  font-size: 100%;\n  font-weight: initial;\n  text-transform: inherit;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n  padding-left: 5px;\n  padding-right: 5px;\n  vertical-align: top;\n}\n\n#gtRandID .gt_row_group_first td {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_row_group_first th {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_summary_row {\n  color: #333333;\n  background-color: #81E3F3;\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_summary_row {\n  border-top-style: none;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_first_summary_row.thick {\n  border-top-width: 2px;\n}\n\n#gtRandID .gt_last_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_grand_summary_row {\n  color: #333333;\n  background-color: #81E3F3;\n  text-transform: inherit;\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_first_grand_summary_row {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-top-style: none;\n  border-top-width: 6px;\n  border-top-color: #D3D3D3;\n}\n\n#gtRandID .gt_last_grand_summary_row_top {\n  padding-top: 8px;\n  padding-bottom: 8px;\n  padding-left: 5px;\n  padding-right: 5px;\n  border-bottom-style: none;\n  border-bottom-width: 6px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_striped {\n  background-color: rgba(128, 128, 128, 0.05);\n}\n\n#gtRandID .gt_table_body {\n  border-top-style: none;\n  border-top-width: 2px;\n  border-top-color: #D3D3D3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnotes {\n  color: #333333;\n  background-color: #81E3F3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_footnote {\n  margin: 0px;\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_sourcenotes {\n  color: #333333;\n  background-color: #81E3F3;\n  border-bottom-style: none;\n  border-bottom-width: 2px;\n  border-bottom-color: #D3D3D3;\n  border-left-style: none;\n  border-left-width: 2px;\n  border-left-color: #D3D3D3;\n  border-right-style: none;\n  border-right-width: 2px;\n  border-right-color: #D3D3D3;\n}\n\n#gtRandID .gt_sourcenote {\n  font-size: 90%;\n  padding-top: 4px;\n  padding-bottom: 4px;\n  padding-left: 5px;\n  padding-right: 5px;\n}\n\n#gtRandID .gt_left {\n  text-align: left;\n}\n\n#gtRandID .gt_center {\n  text-align: center;\n}\n\n#gtRandID .gt_right {\n  text-align: right;\n  font-variant-numeric: tabular-nums;\n}\n\n#gtRandID .gt_font_normal {\n  font-weight: normal;\n}\n\n#gtRandID .gt_font_bold {\n  font-weight: bold;\n}\n\n#gtRandID .gt_font_italic {\n  font-style: italic;\n}\n\n#gtRandID .gt_super {\n  font-size: 65%;\n}\n\n#gtRandID .gt_footnote_marks {\n  font-size: 75%;\n  vertical-align: 0.4em;\n  position: initial;\n}\n\n#gtRandID .gt_asterisk {\n  font-size: 100%;\n  vertical-align: 0;\n}\n\n#gtRandID .gt_indent_1 {\n  text-indent: 5px;\n}\n\n#gtRandID .gt_indent_2 {\n  text-indent: 10px;\n}\n\n#gtRandID .gt_indent_3 {\n  text-indent: 15px;\n}\n\n#gtRandID .gt_indent_4 {\n  text-indent: 20px;\n}\n\n#gtRandID .gt_indent_5 {\n  text-indent: 25px;\n}\n\n#gtRandID .katex-display {\n  display: inline-flex !important;\n  margin-bottom: 0.75em !important;\n}\n\n#gtRandID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {\n  height: 0px !important;\n}\n</style>\n  <table class=\"gt_table\" style=\"table-layout:fixed;width:100%;\" data-quarto-disable-processing=\"false\" data-quarto-bootstrap=\"false\">\n  <colgroup>\n    <col style=\"width:100%;\"/>\n  </colgroup>\n  \n  <tbody class=\"gt_table_body\">\n    <tr><td headers=\"no_data\" class=\"gt_row gt_center\">Please select a site or participant.</td></tr>\n  </tbody>\n  \n  \n</table>\n</div>\n<script>gtShinyBinding.initialize('myPD-gt-table');</script>"

