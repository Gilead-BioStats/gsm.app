# out_gtInteractive() generates the expected object

    Code
      htmltools::as.tags(test_result)
    Output
      <div id="gt-test" class=".gt_table" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#gt-test table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #gt-test thead, #gt-test tbody, #gt-test tfoot, #gt-test tr, #gt-test td, #gt-test th {
        border-style: none;
      }
      
      #gt-test p {
        margin: 0;
        padding: 0;
      }
      
      #gt-test .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #gt-test .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: rgba(255, 255, 255, 0);
        border-bottom-width: 0;
      }
      
      #gt-test .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: rgba(255, 255, 255, 0);
        border-top-width: 0;
      }
      
      #gt-test .gt_heading {
        background-color: rgba(255, 255, 255, 0);
        text-align: center;
        border-bottom-color: rgba(255, 255, 255, 0);
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gt-test .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gt-test .gt_col_headings {
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
      
      #gt-test .gt_col_heading {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #gt-test .gt_column_spanner_outer {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #gt-test .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #gt-test .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #gt-test .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #gt-test .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #gt-test .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #gt-test .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #gt-test .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
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
      
      #gt-test .gt_stub {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gt-test .gt_stub_row_group {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #gt-test .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #gt-test .gt_summary_row {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gt-test .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #gt-test .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #gt-test .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gt-test .gt_grand_summary_row {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gt-test .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #gt-test .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #gt-test .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #gt-test .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gt-test .gt_footnotes {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gt-test .gt_sourcenotes {
        color: #333333;
        background-color: rgba(255, 255, 255, 0);
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
      
      #gt-test .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gt-test .gt_left {
        text-align: left;
      }
      
      #gt-test .gt_center {
        text-align: center;
      }
      
      #gt-test .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #gt-test .gt_font_normal {
        font-weight: normal;
      }
      
      #gt-test .gt_font_bold {
        font-weight: bold;
      }
      
      #gt-test .gt_font_italic {
        font-style: italic;
      }
      
      #gt-test .gt_super {
        font-size: 65%;
      }
      
      #gt-test .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #gt-test .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #gt-test .gt_indent_1 {
        text-indent: 5px;
      }
      
      #gt-test .gt_indent_2 {
        text-indent: 10px;
      }
      
      #gt-test .gt_indent_3 {
        text-indent: 15px;
      }
      
      #gt-test .gt_indent_4 {
        text-indent: 20px;
      }
      
      #gt-test .gt_indent_5 {
        text-indent: 25px;
      }
      
      #gt-test .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #gt-test div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <div id="gt-test" class="reactable html-widget" style="width:auto;height:auto;"></div>
        <script type="application/json" data-for="gt-test">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"a":[1,2,3],"b":[4,5,6]},"columns":[{"id":".selection","name":"","type":null,"na":"NA","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","resizable":false,"width":45,"selectable":true},{"id":"a","name":"a","type":"numeric","na":"NA","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"right"},{"id":"b","name":"b","type":"numeric","na":"NA","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"right"}],"resizable":true,"defaultPageSize":10,"showPageSizeOptions":true,"pageSizeOptions":[10,25,50,100],"paginationType":"numbers","showPagination":true,"showPageInfo":true,"minRows":1,"selection":"single","onClick":"select","highlight":true,"striped":true,"compact":true,"nowrap":true,"height":"auto","theme":{"color":"#333333","backgroundColor":"transparent","stripedColor":"rgba(128,128,128,0.05)","style":{"font-family":"system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif","fontSize":"16px"},"tableStyle":{"borderTopStyle":"solid","borderTopWidth":"2px","borderTopColor":"#D3D3D3"},"headerStyle":{"fontWeight":"normal","backgroundColor":"transparent","borderBottomStyle":"solid","borderBottomWidth":"2px","borderBottomColor":"#D3D3D3"},"groupHeaderStyle":{"fontWeight":"normal","backgroundColor":"transparent","borderBottomStyle":"solid","borderBottomWidth":"2px","borderBottomColor":"#D3D3D3"},"cellStyle":{"fontWeight":"normal"}},"elementId":"gt-test","dataKey":"9c92c5c24f8c2c7d92cfbc7d2f955777"},"children":[]},"class":"reactR_markup"},"evals":["tag.attribs.columns.0.style","tag.attribs.columns.1.style","tag.attribs.columns.2.style"],"jsHooks":[]}</script>
      </div>

# out_gtPlaceholder() generates the expected object

    Code
      htmltools::as.tags(test_result)
    Output
      <div id="testPlaceholder" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#testPlaceholder table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #testPlaceholder thead, #testPlaceholder tbody, #testPlaceholder tfoot, #testPlaceholder tr, #testPlaceholder td, #testPlaceholder th {
        border-style: none;
      }
      
      #testPlaceholder p {
        margin: 0;
        padding: 0;
      }
      
      #testPlaceholder .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #81E3F3;
        width: auto;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #testPlaceholder .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #81E3F3;
        border-bottom-width: 0;
      }
      
      #testPlaceholder .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #81E3F3;
        border-top-width: 0;
      }
      
      #testPlaceholder .gt_heading {
        background-color: #81E3F3;
        text-align: center;
        border-bottom-color: #81E3F3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_bottom_border {
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_col_headings {
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_col_heading {
        color: #333333;
        background-color: #81E3F3;
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
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #testPlaceholder .gt_column_spanner_outer {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #testPlaceholder .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #testPlaceholder .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #testPlaceholder .gt_column_spanner {
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #testPlaceholder .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #testPlaceholder .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
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
      
      #testPlaceholder .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #testPlaceholder .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #testPlaceholder .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #testPlaceholder .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: none;
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
      
      #testPlaceholder .gt_stub {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_stub_row_group {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #testPlaceholder .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_summary_row {
        color: #333333;
        background-color: #81E3F3;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_first_summary_row {
        border-top-style: none;
        border-top-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_grand_summary_row {
        color: #333333;
        background-color: #81E3F3;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: none;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: none;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #testPlaceholder .gt_table_body {
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_footnotes {
        color: #333333;
        background-color: #81E3F3;
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
      
      #testPlaceholder .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_sourcenotes {
        color: #333333;
        background-color: #81E3F3;
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
      
      #testPlaceholder .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_left {
        text-align: left;
      }
      
      #testPlaceholder .gt_center {
        text-align: center;
      }
      
      #testPlaceholder .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #testPlaceholder .gt_font_normal {
        font-weight: normal;
      }
      
      #testPlaceholder .gt_font_bold {
        font-weight: bold;
      }
      
      #testPlaceholder .gt_font_italic {
        font-style: italic;
      }
      
      #testPlaceholder .gt_super {
        font-size: 65%;
      }
      
      #testPlaceholder .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #testPlaceholder .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #testPlaceholder .gt_indent_1 {
        text-indent: 5px;
      }
      
      #testPlaceholder .gt_indent_2 {
        text-indent: 10px;
      }
      
      #testPlaceholder .gt_indent_3 {
        text-indent: 15px;
      }
      
      #testPlaceholder .gt_indent_4 {
        text-indent: 20px;
      }
      
      #testPlaceholder .gt_indent_5 {
        text-indent: 25px;
      }
      
      #testPlaceholder .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #testPlaceholder div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" style="table-layout:fixed;width:100%;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:100%;"/>
        </colgroup>
        
        <tbody class="gt_table_body">
          <tr><td headers="no_data" class="gt_row gt_center">Please select a site.</td></tr>
        </tbody>
        
        
      </table>
      </div>

---

    Code
      htmltools::as.tags(test_result)
    Output
      <div id="testPlaceholder" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#testPlaceholder table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #testPlaceholder thead, #testPlaceholder tbody, #testPlaceholder tfoot, #testPlaceholder tr, #testPlaceholder td, #testPlaceholder th {
        border-style: none;
      }
      
      #testPlaceholder p {
        margin: 0;
        padding: 0;
      }
      
      #testPlaceholder .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #81E3F3;
        width: auto;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #testPlaceholder .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #81E3F3;
        border-bottom-width: 0;
      }
      
      #testPlaceholder .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #81E3F3;
        border-top-width: 0;
      }
      
      #testPlaceholder .gt_heading {
        background-color: #81E3F3;
        text-align: center;
        border-bottom-color: #81E3F3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_bottom_border {
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_col_headings {
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_col_heading {
        color: #333333;
        background-color: #81E3F3;
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
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #testPlaceholder .gt_column_spanner_outer {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #testPlaceholder .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #testPlaceholder .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #testPlaceholder .gt_column_spanner {
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #testPlaceholder .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #testPlaceholder .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
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
      
      #testPlaceholder .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #testPlaceholder .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #testPlaceholder .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #testPlaceholder .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: none;
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
      
      #testPlaceholder .gt_stub {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_stub_row_group {
        color: #333333;
        background-color: #81E3F3;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #testPlaceholder .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_summary_row {
        color: #333333;
        background-color: #81E3F3;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_first_summary_row {
        border-top-style: none;
        border-top-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #testPlaceholder .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_grand_summary_row {
        color: #333333;
        background-color: #81E3F3;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: none;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: none;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #testPlaceholder .gt_table_body {
        border-top-style: none;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #testPlaceholder .gt_footnotes {
        color: #333333;
        background-color: #81E3F3;
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
      
      #testPlaceholder .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_sourcenotes {
        color: #333333;
        background-color: #81E3F3;
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
      
      #testPlaceholder .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #testPlaceholder .gt_left {
        text-align: left;
      }
      
      #testPlaceholder .gt_center {
        text-align: center;
      }
      
      #testPlaceholder .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #testPlaceholder .gt_font_normal {
        font-weight: normal;
      }
      
      #testPlaceholder .gt_font_bold {
        font-weight: bold;
      }
      
      #testPlaceholder .gt_font_italic {
        font-style: italic;
      }
      
      #testPlaceholder .gt_super {
        font-size: 65%;
      }
      
      #testPlaceholder .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #testPlaceholder .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #testPlaceholder .gt_indent_1 {
        text-indent: 5px;
      }
      
      #testPlaceholder .gt_indent_2 {
        text-indent: 10px;
      }
      
      #testPlaceholder .gt_indent_3 {
        text-indent: 15px;
      }
      
      #testPlaceholder .gt_indent_4 {
        text-indent: 20px;
      }
      
      #testPlaceholder .gt_indent_5 {
        text-indent: 25px;
      }
      
      #testPlaceholder .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #testPlaceholder div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" style="table-layout:fixed;width:100%;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <colgroup>
          <col style="width:100%;"/>
        </colgroup>
        
        <tbody class="gt_table_body">
          <tr><td headers="no_data" class="gt_row gt_center">Please select a site and a subject.</td></tr>
        </tbody>
        
        
      </table>
      </div>

