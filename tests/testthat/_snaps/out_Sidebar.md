# out_Sidebar generates the expected UI

    Code
      htmltools::as.tags(test_result$children)
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
          <h2>Study Status</h2>
          <label class="toggle">
        <input class="toggle-checkbox btn-show-details" type="checkbox">
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
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Description">Description</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Value">Value</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="Description" class="gt_row gt_left">Participants Enrolled</td>
      <td headers="Value" class="gt_row gt_left">1301</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Sites Enrolled</td>
      <td headers="Value" class="gt_row gt_left">176</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Nickname</td>
      <td headers="Value" class="gt_row gt_left">Protocol Nickname</td></tr>
        </tbody>
        
        
      </table>
          </div>
          <div id="study_table_hide" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
            <style>#study_table_hide table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #study_table_hide thead, #study_table_hide tbody, #study_table_hide tfoot, #study_table_hide tr, #study_table_hide td, #study_table_hide th {
        border-style: none;
      }
      
      #study_table_hide p {
        margin: 0;
        padding: 0;
      }
      
      #study_table_hide .gt_table {
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
      
      #study_table_hide .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #study_table_hide .gt_title {
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
      
      #study_table_hide .gt_subtitle {
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
      
      #study_table_hide .gt_heading {
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
      
      #study_table_hide .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide .gt_col_headings {
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
      
      #study_table_hide .gt_col_heading {
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
      
      #study_table_hide .gt_column_spanner_outer {
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
      
      #study_table_hide .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #study_table_hide .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #study_table_hide .gt_column_spanner {
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
      
      #study_table_hide .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #study_table_hide .gt_group_heading {
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
      
      #study_table_hide .gt_empty_group_heading {
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
      
      #study_table_hide .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #study_table_hide .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #study_table_hide .gt_row {
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
      
      #study_table_hide .gt_stub {
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
      
      #study_table_hide .gt_stub_row_group {
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
      
      #study_table_hide .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #study_table_hide .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #study_table_hide .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #study_table_hide .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #study_table_hide .gt_last_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide .gt_first_grand_summary_row {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #study_table_hide .gt_last_grand_summary_row_top {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #study_table_hide .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #study_table_hide .gt_footnotes {
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
      
      #study_table_hide .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide .gt_sourcenotes {
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
      
      #study_table_hide .gt_sourcenote {
        font-size: 90%;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #study_table_hide .gt_left {
        text-align: left;
      }
      
      #study_table_hide .gt_center {
        text-align: center;
      }
      
      #study_table_hide .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #study_table_hide .gt_font_normal {
        font-weight: normal;
      }
      
      #study_table_hide .gt_font_bold {
        font-weight: bold;
      }
      
      #study_table_hide .gt_font_italic {
        font-style: italic;
      }
      
      #study_table_hide .gt_super {
        font-size: 65%;
      }
      
      #study_table_hide .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #study_table_hide .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #study_table_hide .gt_indent_1 {
        text-indent: 5px;
      }
      
      #study_table_hide .gt_indent_2 {
        text-indent: 10px;
      }
      
      #study_table_hide .gt_indent_3 {
        text-indent: 15px;
      }
      
      #study_table_hide .gt_indent_4 {
        text-indent: 20px;
      }
      
      #study_table_hide .gt_indent_5 {
        text-indent: 25px;
      }
      
      #study_table_hide .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #study_table_hide div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
            <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <thead>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Description">Description</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Value">Value</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><td headers="Description" class="gt_row gt_left">Participants Enrolled</td>
      <td headers="Value" class="gt_row gt_left">1301</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Sites Enrolled</td>
      <td headers="Value" class="gt_row gt_left">176</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Row Id</td>
      <td headers="Value" class="gt_row gt_left">1-1G9113</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Title</td>
      <td headers="Value" class="gt_row gt_left">Protocol Title</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Nickname</td>
      <td headers="Value" class="gt_row gt_left">Protocol Nickname</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Type</td>
      <td headers="Value" class="gt_row gt_left">Investigator Sponsored</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Phase</td>
      <td headers="Value" class="gt_row gt_left">P3</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Plan Site</td>
      <td headers="Value" class="gt_row gt_left">190</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Site Actl</td>
      <td headers="Value" class="gt_row gt_left">176</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Fpfv</td>
      <td headers="Value" class="gt_row gt_left">2003-01-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Act Fpfv</td>
      <td headers="Value" class="gt_row gt_left">2003-01-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Lplv</td>
      <td headers="Value" class="gt_row gt_left">2021-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Act Lplv</td>
      <td headers="Value" class="gt_row gt_left">2021-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Est Lpfv</td>
      <td headers="Value" class="gt_row gt_left">2020-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Act Lpfv</td>
      <td headers="Value" class="gt_row gt_left">2020-06-01</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Status</td>
      <td headers="Value" class="gt_row gt_left">Active</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Plan Subj</td>
      <td headers="Value" class="gt_row gt_left">1300</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Num Enrolled Subj M</td>
      <td headers="Value" class="gt_row gt_left">1301</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Indication</td>
      <td headers="Value" class="gt_row gt_left">Protocol Indication</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Product</td>
      <td headers="Value" class="gt_row gt_left">Product</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Therapeutic Area</td>
      <td headers="Value" class="gt_row gt_left">Therapeutic Area</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">Protocol Product Number</td>
      <td headers="Value" class="gt_row gt_left">123</td></tr>
          <tr><td headers="Description" class="gt_row gt_left">X Rbm Flg</td>
      <td headers="Value" class="gt_row gt_left">Y</td></tr>
        </tbody>
        
        
      </table>
          </div>
          <script>const detailButton = document.querySelector('.btn-show-details');
      
      if (detailButton !== null) {
          let hidden = false;
      
          detailButton.addEventListener('click', function() {
              const shownTable = document.querySelector('#study_table');
              const hiddenTable = document.querySelector('#study_table_hide');
              const toggleLabel = document.querySelector('.toggle-label');
      
              if (!hidden) {
                  shownTable.style.display = 'none';
                  hiddenTable.style.display = 'block';
                  toggleLabel.innerHTML = 'Hide Details';
                  hidden = true;
              } else {
                  shownTable.style.display = 'block';
                  hiddenTable.style.display = 'none';
                  toggleLabel.innerHTML = 'Show Details';
                  hidden = false;
              }
          })
      }</script>
          <div class="date">Snapshot Date: 2019-11-01</div>
        </div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container overflow-on" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container overflow-on" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
          <div class="form-group shiny-input-container" style="width:100%;">
            <label class="control-label" id="metric-label" for="metric">
              <strong>Metric</strong>
            </label>
            <div>
              <select id="metric" class="shiny-input-select"><option value="kri0001" selected>Adverse Event Rate</option>
      <option value="kri0002">Serious Adverse Event Rate</option></select>
              <script type="application/json" data-for="metric" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
            </div>
          </div>
          <div class="form-group shiny-input-container" style="width:100%;">
            <label class="control-label" id="site-label" for="site">
              <strong>Site</strong>
            </label>
            <div>
              <select id="site" class="shiny-input-select"><option value="None" selected>None</option>
      <option value="0X001">0X001</option>
      <option value="0X002">0X002</option>
      <option value="0X003">0X003</option>
      <option value="0X004">0X004</option>
      <option value="0X005">0X005</option>
      <option value="0X006">0X006</option>
      <option value="0X007">0X007</option>
      <option value="0X008">0X008</option>
      <option value="0X010">0X010</option>
      <option value="0X011">0X011</option>
      <option value="0X012">0X012</option>
      <option value="0X013">0X013</option>
      <option value="0X014">0X014</option>
      <option value="0X015">0X015</option>
      <option value="0X016">0X016</option>
      <option value="0X018">0X018</option>
      <option value="0X020">0X020</option>
      <option value="0X021">0X021</option>
      <option value="0X022">0X022</option>
      <option value="0X023">0X023</option>
      <option value="0X024">0X024</option>
      <option value="0X025">0X025</option>
      <option value="0X026">0X026</option>
      <option value="0X027">0X027</option>
      <option value="0X028">0X028</option>
      <option value="0X029">0X029</option>
      <option value="0X030">0X030</option>
      <option value="0X031">0X031</option>
      <option value="0X033">0X033</option>
      <option value="0X034">0X034</option>
      <option value="0X035">0X035</option>
      <option value="0X036">0X036</option>
      <option value="0X037">0X037</option>
      <option value="0X038">0X038</option>
      <option value="0X039">0X039</option>
      <option value="0X040">0X040</option>
      <option value="0X041">0X041</option>
      <option value="0X042">0X042</option>
      <option value="0X043">0X043</option>
      <option value="0X045">0X045</option>
      <option value="0X046">0X046</option>
      <option value="0X047">0X047</option>
      <option value="0X048">0X048</option>
      <option value="0X049">0X049</option>
      <option value="0X050">0X050</option>
      <option value="0X051">0X051</option>
      <option value="0X052">0X052</option>
      <option value="0X054">0X054</option>
      <option value="0X055">0X055</option>
      <option value="0X056">0X056</option>
      <option value="0X057">0X057</option>
      <option value="0X058">0X058</option>
      <option value="0X059">0X059</option>
      <option value="0X061">0X061</option>
      <option value="0X062">0X062</option>
      <option value="0X063">0X063</option>
      <option value="0X064">0X064</option>
      <option value="0X065">0X065</option>
      <option value="0X066">0X066</option>
      <option value="0X068">0X068</option>
      <option value="0X069">0X069</option>
      <option value="0X072">0X072</option>
      <option value="0X073">0X073</option>
      <option value="0X074">0X074</option>
      <option value="0X075">0X075</option>
      <option value="0X076">0X076</option>
      <option value="0X077">0X077</option>
      <option value="0X078">0X078</option>
      <option value="0X079">0X079</option>
      <option value="0X080">0X080</option>
      <option value="0X081">0X081</option>
      <option value="0X082">0X082</option>
      <option value="0X083">0X083</option>
      <option value="0X084">0X084</option>
      <option value="0X085">0X085</option>
      <option value="0X086">0X086</option>
      <option value="0X087">0X087</option>
      <option value="0X088">0X088</option>
      <option value="0X089">0X089</option>
      <option value="0X090">0X090</option>
      <option value="0X091">0X091</option>
      <option value="0X092">0X092</option>
      <option value="0X093">0X093</option>
      <option value="0X094">0X094</option>
      <option value="0X095">0X095</option>
      <option value="0X096">0X096</option>
      <option value="0X097">0X097</option>
      <option value="0X098">0X098</option>
      <option value="0X099">0X099</option>
      <option value="0X100">0X100</option>
      <option value="0X101">0X101</option>
      <option value="0X102">0X102</option>
      <option value="0X103">0X103</option>
      <option value="0X104">0X104</option>
      <option value="0X105">0X105</option>
      <option value="0X106">0X106</option>
      <option value="0X107">0X107</option>
      <option value="0X108">0X108</option>
      <option value="0X109">0X109</option>
      <option value="0X110">0X110</option>
      <option value="0X113">0X113</option>
      <option value="0X114">0X114</option>
      <option value="0X115">0X115</option>
      <option value="0X116">0X116</option>
      <option value="0X117">0X117</option>
      <option value="0X118">0X118</option>
      <option value="0X119">0X119</option>
      <option value="0X120">0X120</option>
      <option value="0X121">0X121</option>
      <option value="0X122">0X122</option>
      <option value="0X123">0X123</option>
      <option value="0X124">0X124</option>
      <option value="0X125">0X125</option>
      <option value="0X126">0X126</option>
      <option value="0X127">0X127</option>
      <option value="0X129">0X129</option>
      <option value="0X130">0X130</option>
      <option value="0X131">0X131</option>
      <option value="0X132">0X132</option>
      <option value="0X133">0X133</option>
      <option value="0X134">0X134</option>
      <option value="0X135">0X135</option>
      <option value="0X136">0X136</option>
      <option value="0X137">0X137</option>
      <option value="0X138">0X138</option>
      <option value="0X139">0X139</option>
      <option value="0X140">0X140</option>
      <option value="0X141">0X141</option>
      <option value="0X142">0X142</option>
      <option value="0X143">0X143</option>
      <option value="0X144">0X144</option>
      <option value="0X147">0X147</option>
      <option value="0X148">0X148</option>
      <option value="0X149">0X149</option>
      <option value="0X151">0X151</option>
      <option value="0X152">0X152</option>
      <option value="0X153">0X153</option>
      <option value="0X154">0X154</option>
      <option value="0X155">0X155</option>
      <option value="0X156">0X156</option>
      <option value="0X157">0X157</option>
      <option value="0X159">0X159</option>
      <option value="0X160">0X160</option>
      <option value="0X161">0X161</option>
      <option value="0X162">0X162</option>
      <option value="0X163">0X163</option>
      <option value="0X164">0X164</option>
      <option value="0X165">0X165</option>
      <option value="0X166">0X166</option>
      <option value="0X167">0X167</option>
      <option value="0X168">0X168</option>
      <option value="0X169">0X169</option>
      <option value="0X170">0X170</option>
      <option value="0X171">0X171</option>
      <option value="0X172">0X172</option>
      <option value="0X173">0X173</option>
      <option value="0X174">0X174</option>
      <option value="0X175">0X175</option>
      <option value="0X176">0X176</option>
      <option value="0X177">0X177</option>
      <option value="0X178">0X178</option>
      <option value="0X179">0X179</option>
      <option value="0X180">0X180</option>
      <option value="0X181">0X181</option>
      <option value="0X182">0X182</option>
      <option value="0X183">0X183</option>
      <option value="0X184">0X184</option>
      <option value="0X186">0X186</option>
      <option value="0X188">0X188</option>
      <option value="0X189">0X189</option>
      <option value="0X190">0X190</option>
      <option value="X044X">X044X</option>
      <option value="X060X">X060X</option>
      <option value="X067X">X067X</option>
      <option value="X185X">X185X</option>
      <option value="X187X">X187X</option></select>
              <script type="application/json" data-for="site" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
            </div>
          </div>
          <div class="form-group shiny-input-container" style="width:100%;">
            <label class="control-label" id="participant-label" for="participant">
              <strong>Participant</strong>
            </label>
            <div>
              <select class="shiny-input-select form-control" id="participant"></select>
              <script type="application/json" data-for="participant">{"maxOptions":10,"plugins":["selectize-plugin-a11y"]}</script>
            </div>
          </div>
          <button class="btn btn-default action-button btn btn-primary btn-sm" id="reset" type="button">Reset All</button>
        </div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

