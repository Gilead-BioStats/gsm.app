# out_MainTabs generates the expected UI

    Code
      test_result
    Output
      <body class="bslib-page-navbar">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" data-bs-theme="auto">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-XXXX" data-bs-toggle="collapse" data-bs-target="#navbar-collapse-XXXX">
                <span class="sr-only visually-hidden">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <span class="navbar-brand">Protocol Nickname</span>
            </div>
            <div class="navbar-collapse collapse" id="navbar-collapse-XXXX">
              <ul class="nav navbar-nav nav-underline shiny-tab-input" id="primary_nav_bar" data-tabsetid="XXXX">
                <li class="active">
                  <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Study Overview">Study Overview</a>
                </li>
                <li>
                  <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Metric Details">Metric Details</a>
                </li>
                <li>
                  <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="Domain Details">Domain Details</a>
                </li>
                <div class="bslib-nav-spacer"></div>
                <li class="bslib-nav-item nav-item form-inline navbar-extras">
                  <div class="form-group shiny-input-container shiny-input-container-inline">
                    <label class="control-label" id="site-label" for="site">
                      <strong>Site</strong>
                    </label>
                    <div id="site" class="virtual-select" style="display:inline-block;" data-update="change">
                      <script type="application/json" data-for="site">{"stateInput":true,"options":{"type":["vector"],"choices":["All","0X001","0X002","0X003","0X004","0X005","0X006","0X007","0X008","0X010","0X011","0X012","0X013","0X014","0X015","0X016","0X021","0X022","0X024","0X026","0X027","0X028","0X029","0X037","0X041","0X043","0X064","0X079","0X103","0X109","0X124","0X155","0X159","0X170","0X173","X185X"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                    </div>
                  </div>
                </li>
                <li class="bslib-nav-item nav-item form-inline navbar-extras">
                  <div class="form-group shiny-input-container shiny-input-container-inline">
                    <label class="control-label" id="participant-label" for="participant">
                      <strong>Participant</strong>
                    </label>
                    <div id="participant" class="virtual-select" style="display:inline-block;" data-update="change">
                      <script type="application/json" data-for="participant">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":[],"value":[]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                    </div>
                  </div>
                </li>
                <li class="bslib-nav-item nav-item form-inline navbar-extras">
                  <button class="btn btn-default action-button btn-primary" id="reset" type="button">
                    <i class="fas fa-rotate" role="presentation" aria-label="rotate icon" title="Reset all inputs"></i>
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="container-fluid">
          <div class="tab-content" data-tabsetid="XXXX">
            <div class="tab-pane active" data-value="Study Overview" id="tab-XXXX-1">
              <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="2,10" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                    <div class="card-header">
                      <h5>Study Information</h5>
                      <h6 class="card-subtitle mb-2 text-muted">Snapshot Date: 2018-01-01</h6>
                    </div>
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <label class="toggle">
        <input class="toggle-checkbox btn-show-details" type="checkbox"
          data-shown-table="study_table"
          data-hidden-table="study_table_hide"
          data-hidden="false"
          onclick="toggleTables(this)">
        <div class="toggle-switch"></div>
        <span class="toggle-label">Show Details</span>
      </label>
                      <div id="study_table" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
                        <style>#study_table table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #study_table thead, #study_table tbody, #study_table tfoot, #study_table tr, #study_table td, #study_table th {
        border-style: none;
      }
      
      #study_table p {
        margin: 0;
        padding: 0;
      }
      
      #study_table .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #study_table .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #study_table .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #study_table .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 1px;
        padding-bottom: 3px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #study_table .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #study_table .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #study_table .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 2.5px;
        padding-bottom: 3.5px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #study_table .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #study_table .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #study_table .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #study_table .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 2.5px;
        padding-bottom: 2.5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #study_table .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #study_table .gt_group_heading {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #study_table .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #study_table .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #study_table .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #study_table .gt_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #study_table .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #study_table .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #study_table .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #study_table .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #study_table .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #study_table .gt_last_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table .gt_first_grand_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #study_table .gt_last_grand_summary_row_top {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #study_table .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #study_table .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #study_table .gt_sourcenote {
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table .gt_left {
        text-align: left;
      }
      
      #study_table .gt_center {
        text-align: center;
      }
      
      #study_table .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #study_table .gt_font_normal {
        font-weight: normal;
      }
      
      #study_table .gt_font_bold {
        font-weight: bold;
      }
      
      #study_table .gt_font_italic {
        font-style: italic;
      }
      
      #study_table .gt_super {
        font-size: 65%;
      }
      
      #study_table .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #study_table .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #study_table .gt_indent_1 {
        text-indent: 5px;
      }
      
      #study_table .gt_indent_2 {
        text-indent: 10px;
      }
      
      #study_table .gt_indent_3 {
        text-indent: 15px;
      }
      
      #study_table .gt_indent_4 {
        text-indent: 20px;
      }
      
      #study_table .gt_indent_5 {
        text-indent: 25px;
      }
      
      #study_table .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #study_table div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
                        <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        
        <tbody class="gt_table_body">
          <tr><td headers="Description" class="gt_row gt_left">Nickname</td>
      <td headers="Value" class="gt_row gt_right">Protocol Nickname</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Status</td>
      <td headers="Value" class="gt_row gt_right">Active</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Site Activation</td>
      <td headers="Value" class="gt_row gt_right">35 / 190 (18.4%)</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Participant Enrollment</td>
      <td headers="Value" class="gt_row gt_right">227 / 1300 (17.5%)</td></tr>
        </tbody>
        
        
      </table>
                      </div>
                      <div id="study_table_hide" style="display: none;">
                        <div id="study_table_hide_gt" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
                          <style>#study_table_hide_gt table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #study_table_hide_gt thead, #study_table_hide_gt tbody, #study_table_hide_gt tfoot, #study_table_hide_gt tr, #study_table_hide_gt td, #study_table_hide_gt th {
        border-style: none;
      }
      
      #study_table_hide_gt p {
        margin: 0;
        padding: 0;
      }
      
      #study_table_hide_gt .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #study_table_hide_gt .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #study_table_hide_gt .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 1px;
        padding-bottom: 3px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #study_table_hide_gt .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 2.5px;
        padding-bottom: 3.5px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #study_table_hide_gt .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #study_table_hide_gt .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #study_table_hide_gt .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #study_table_hide_gt .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 2.5px;
        padding-bottom: 2.5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #study_table_hide_gt .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #study_table_hide_gt .gt_group_heading {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #study_table_hide_gt .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #study_table_hide_gt .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #study_table_hide_gt .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #study_table_hide_gt .gt_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #study_table_hide_gt .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide_gt .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #study_table_hide_gt .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #study_table_hide_gt .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #study_table_hide_gt .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide_gt .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #study_table_hide_gt .gt_last_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide_gt .gt_first_grand_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_last_grand_summary_row_top {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #study_table_hide_gt .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide_gt .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #study_table_hide_gt .gt_sourcenote {
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide_gt .gt_left {
        text-align: left;
      }
      
      #study_table_hide_gt .gt_center {
        text-align: center;
      }
      
      #study_table_hide_gt .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #study_table_hide_gt .gt_font_normal {
        font-weight: normal;
      }
      
      #study_table_hide_gt .gt_font_bold {
        font-weight: bold;
      }
      
      #study_table_hide_gt .gt_font_italic {
        font-style: italic;
      }
      
      #study_table_hide_gt .gt_super {
        font-size: 65%;
      }
      
      #study_table_hide_gt .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #study_table_hide_gt .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #study_table_hide_gt .gt_indent_1 {
        text-indent: 5px;
      }
      
      #study_table_hide_gt .gt_indent_2 {
        text-indent: 10px;
      }
      
      #study_table_hide_gt .gt_indent_3 {
        text-indent: 15px;
      }
      
      #study_table_hide_gt .gt_indent_4 {
        text-indent: 20px;
      }
      
      #study_table_hide_gt .gt_indent_5 {
        text-indent: 25px;
      }
      
      #study_table_hide_gt .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #study_table_hide_gt div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
                          <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        
        <tbody class="gt_table_body">
          <tr><td headers="Description" class="gt_row gt_left">Studyid</td>
      <td headers="Value" class="gt_row gt_right">AA-AA-000-0000</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Nickname</td>
      <td headers="Value" class="gt_row gt_right">Protocol Nickname</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Title</td>
      <td headers="Value" class="gt_row gt_right">Protocol Title</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Status</td>
      <td headers="Value" class="gt_row gt_right">Active</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Plan Site</td>
      <td headers="Value" class="gt_row gt_right">190</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Plan Subj</td>
      <td headers="Value" class="gt_row gt_right">1300</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Act Fpfv</td>
      <td headers="Value" class="gt_row gt_right">2003-01-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Fpfv</td>
      <td headers="Value" class="gt_row gt_right">2003-01-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Lplv</td>
      <td headers="Value" class="gt_row gt_right">2021-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Lpfv</td>
      <td headers="Value" class="gt_row gt_right">2020-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Therapeutic Area</td>
      <td headers="Value" class="gt_row gt_right">Therapeutic Area</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Indication</td>
      <td headers="Value" class="gt_row gt_right">Protocol Indication</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Phase</td>
      <td headers="Value" class="gt_row gt_right">P3</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Product</td>
      <td headers="Value" class="gt_row gt_right">Product</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Site Target</td>
      <td headers="Value" class="gt_row gt_right">190</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Participant Target</td>
      <td headers="Value" class="gt_row gt_right">1300</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Participants Enrolled</td>
      <td headers="Value" class="gt_row gt_right">227</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Sites Enrolled</td>
      <td headers="Value" class="gt_row gt_right">35</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Percent Sites Activated</td>
      <td headers="Value" class="gt_row gt_right">18.4</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Site Activation</td>
      <td headers="Value" class="gt_row gt_right">35 / 190 (18.4%)</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Percent Participants Enrolled</td>
      <td headers="Value" class="gt_row gt_right">17.5</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Participant Enrollment</td>
      <td headers="Value" class="gt_row gt_right">227 / 1300 (17.5%)</td></tr>
        </tbody>
        
        
      </table>
                        </div>
                      </div>
                    </div>
                    <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div class="tabbable">
                    <ul class="nav nav-underline shiny-tab-input" id="study_overview-nav_bar" data-tabsetid="XXXX">
                      <li class="active">
                        <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Overview Table">Overview Table</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plots">Scatter Plots</a>
                      </li>
                    </ul>
                    <div class="tab-content" data-tabsetid="XXXX">
                      <div class="tab-pane active" data-value="Overview Table" id="tab-XXXX-1">
                        <div>
                          <style>#study_overview-table .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-table">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div id="study_overview-table-kri_counts">
                                <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="study_overview-table-kri_counts-red-toggle_pill" style="background-color: #FF5859; opacity: 0.5;">1 Red KRIs</a>
                                <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="study_overview-table-kri_counts-amber-toggle_pill" style="background-color: #FEAA02; opacity: 0.5;">4 Amber KRIs</a>
                              </div>
                              <div class="row gy-2">
                                <div class="Widget_GroupOverview html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-table-group_overview" style="width:100%;height:100%;"></div>
                                <div class="footnote">Click cells for associated risk signal details.</div>
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
                      <div class="tab-pane" data-value="Scatter Plots" id="tab-XXXX-2">
                        <div class="bslib-grid bslib-mb-spacing html-fill-item" data-require-bs-caller="layout_column_wrap()" data-require-bs-version="5" id="study_overview-scatter" style="grid-template-columns:repeat(2, minmax(0, 1fr));grid-auto-rows:1fr;--bslib-grid-height:auto;--bslib-grid-height-mobile:auto;">
                          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                            <div>
                              <style>#study_overview-scatter-Analysis_kri0001 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0001">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Adverse Event Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0001-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0002 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0002">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Serious Adverse Event Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0002-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0003 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0003">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Non-Important Protocol Deviation Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0003-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0004 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0004">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Important Protocol Deviation Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0004-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0005 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0005">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Grade 3+ Lab Abnormality Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0005-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0006 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0006">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Study Discontinuation Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0006-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0007 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0007">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Treatment Discontinuation Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0007-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0008 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0008">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Query Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0008-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0009 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0009">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Delayed Query Resolution Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0009-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0010 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0010">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Delayed Data Entry Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0010-plot" style="width:100%;height:400px;"></div>
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
                              <style>#study_overview-scatter-Analysis_kri0011 .bslib-full-screen-enter { bottom: unset !important; }</style>
                              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0011">
                                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                                  <h5>Data Change Rate</h5>
                                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0011-plot" style="width:100%;height:400px;"></div>
                                </div>
                                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                                  <template>Expand</template>
                                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                                </bslib-tooltip>
                                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                              </div>
                            </div>
                          </div>
                        </div>
                        <script>detectCardClicks('study_overview-scatter', 'study_overview-scatter-selectedScatterPlot')</script>
                      </div>
                    </div>
                  </div>
                </div>
              </bslib-layout-columns>
            </div>
            <div class="tab-pane" data-value="Metric Details" id="tab-XXXX-2">
              <div class="tabbable">
                <ul class="nav nav-underline shiny-tab-input" id="metric_details-selected_tab" data-tabsetid="XXXX">
                  <li class="bslib-nav-item nav-item form-inline navbar-extras">
                    <div class="form-group shiny-input-container shiny-input-container-inline">
                      <label class="control-label shiny-label-null" for="metric_details-metric" id="metric_details-metric-label"></label>
                      <div id="metric_details-metric" class="virtual-select" style="display:inline-block;" data-update="change">
                        <script type="application/json" data-for="metric_details-metric">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Adverse Event Rate","Serious Adverse Event Rate","Non-Important Protocol Deviation Rate","Important Protocol Deviation Rate","Grade 3+ Lab Abnormality Rate","Study Discontinuation Rate","Treatment Discontinuation Rate","Query Rate","Delayed Query Resolution Rate","Delayed Data Entry Rate","Data Change Rate"],"value":["Analysis_kri0001","Analysis_kri0002","Analysis_kri0003","Analysis_kri0004","Analysis_kri0005","Analysis_kri0006","Analysis_kri0007","Analysis_kri0008","Analysis_kri0009","Analysis_kri0010","Analysis_kri0011"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                      </div>
                    </div>
                  </li>
                  <div class="bslib-nav-spacer"></div>
                  <li class="active">
                    <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plot">Scatter Plot</a>
                  </li>
                  <li>
                    <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Value)">Bar Chart (KRI Value)</a>
                  </li>
                  <li>
                    <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Score)">Bar Chart (KRI Score)</a>
                  </li>
                  <li>
                    <a href="#tab-XXXX-6" data-toggle="tab" data-bs-toggle="tab" data-value="Time Series">Time Series</a>
                  </li>
                  <li>
                    <a href="#tab-XXXX-7" data-toggle="tab" data-bs-toggle="tab" data-value="Analysis Output">Analysis Output</a>
                  </li>
                </ul>
                <div class="tab-content" data-tabsetid="XXXX">
                  <div class="tab-pane active" data-value="Scatter Plot" id="tab-XXXX-3">
                    <div>
                      <style>#metric_details-scatter_plot .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-scatter_plot">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-scatter_plot-plot" style="width:100%;height:400px;"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" data-value="Bar Chart (KRI Value)" id="tab-XXXX-4">
                    <div>
                      <style>#metric_details-bar_chart_metric .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-bar_chart_metric">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_metric-plot" style="width:100%;height:400px;"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" data-value="Bar Chart (KRI Score)" id="tab-XXXX-5">
                    <div>
                      <style>#metric_details-bar_chart_score .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-bar_chart_score">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_score-plot" style="width:100%;height:400px;"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" data-value="Time Series" id="tab-XXXX-6">
                    <div>
                      <style>#metric_details-time_series .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-time_series">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-time_series-plot" style="width:100%;height:400px;"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" data-value="Analysis Output" id="tab-XXXX-7">
                    <div>
                      <style>#metric_details-analysis_output .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container MetricTable" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-analysis_output">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <div class="shiny-html-output gt_shiny" id="metric_details-analysis_output-gt-table"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="5,7" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div id="site_details-card_site_metadata_list" class="shinyjs-hide">
                    <div>
                      <style>#site_details-card_site_metadata_list-contents .bslib-full-screen-enter { bottom: unset !important; }</style>
                      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_site_metadata_list-contents">
                        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                          <h5>Site Metadata</h5>
                          <div id="site_details-site_metadata_list" class="shiny-html-output"></div>
                        </div>
                        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                          <template>Expand</template>
                          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                        </bslib-tooltip>
                        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                      </div>
                    </div>
                  </div>
                  <div>
                    <style>#site_details-card_placeholder_site_metadata_list .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_placeholder_site_metadata_list">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Site Metadata</h5>
                        <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a site.</div>
                          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
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
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#site_details-participants-gt_card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-participants-gt_card">
                      <div class="card-header">
                        <h5>
                          <span id="site_details-participants-title" class="shiny-text-output"></span>
                        </h5>
                        <div id="site_details-participants-subtitle" class="shiny-html-output"></div>
                      </div>
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="site_details-participants-gt-table"></div>
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
            <div class="tab-pane" data-value="Domain Details" id="tab-XXXX-3">
              <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="3,9" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#domain_details-counts-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-counts-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Domain Summary</h5>
                        <div id="domain_details-counts-domain_list" class="shiny-html-output"></div>
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
                  <div class="tabbable">
                    <ul class="nav nav-underline shiny-tab-input" id="domain_details-selected_tab" data-tabsetid="XXXX">
                      <li class="active">
                        <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="AE">Adverse Events</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="ENROLL">Enrollment</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="LB">Lab</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="PD">Protocol Deviations</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="SDRGCOMP">Treatment Completion</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-6" data-toggle="tab" data-bs-toggle="tab" data-value="STUDCOMP">Study Completion</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-7" data-toggle="tab" data-bs-toggle="tab" data-value="SUBJ">Subject Metadata</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-8" data-toggle="tab" data-bs-toggle="tab" data-value="DATACHG">Data Changes</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-9" data-toggle="tab" data-bs-toggle="tab" data-value="DATAENT">Data Entry</a>
                      </li>
                      <li>
                        <a href="#tab-XXXX-10" data-toggle="tab" data-bs-toggle="tab" data-value="QUERY">Queries</a>
                      </li>
                    </ul>
                    <div class="tab-content" data-tabsetid="XXXX">
                      <div class="tab-pane active" data-value="AE" id="tab-XXXX-1">
                        <div>
                          <style>#domain_details-AE-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-AE-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-AE-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="ENROLL" id="tab-XXXX-2">
                        <div>
                          <style>#domain_details-ENROLL-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-ENROLL-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-ENROLL-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="LB" id="tab-XXXX-3">
                        <div>
                          <style>#domain_details-LB-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-LB-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-LB-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="PD" id="tab-XXXX-4">
                        <div>
                          <style>#domain_details-PD-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-PD-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-PD-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="SDRGCOMP" id="tab-XXXX-5">
                        <div>
                          <style>#domain_details-SDRGCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SDRGCOMP-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-SDRGCOMP-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="STUDCOMP" id="tab-XXXX-6">
                        <div>
                          <style>#domain_details-STUDCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-STUDCOMP-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-STUDCOMP-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="SUBJ" id="tab-XXXX-7">
                        <div>
                          <style>#domain_details-SUBJ-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SUBJ-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-SUBJ-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="DATACHG" id="tab-XXXX-8">
                        <div>
                          <style>#domain_details-DATACHG-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATACHG-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-DATACHG-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="DATAENT" id="tab-XXXX-9">
                        <div>
                          <style>#domain_details-DATAENT-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATAENT-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-DATAENT-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" data-value="QUERY" id="tab-XXXX-10">
                        <div>
                          <style>#domain_details-QUERY-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-QUERY-card">
                            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                              <div class="shiny-html-output gt_shiny" id="domain_details-QUERY-gt-table"></div>
                            </div>
                            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                              <template>Expand</template>
                              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                            </bslib-tooltip>
                            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </bslib-layout-columns>
            </div>
          </div>
        </div>
      </body>

