# mod_DomainDetails_UI() returns the expected UI

    Code
      test_result
    Output
      <div class="tabbable">
      <ul class="nav nav-underline shiny-tab-input" id="domain_details-selected_tab" data-tabsetid="XXXX">
      <li class="active">
      <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="AE">Adverse Events (<span id="domain_details-AE-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="DATACHG">Data Changes (<span id="domain_details-DATACHG-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="DATAENT">Data Entry (<span id="domain_details-DATAENT-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="ENROLL">Enrollment (<span id="domain_details-ENROLL-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="LB">Lab (<span id="domain_details-LB-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-6" data-toggle="tab" data-bs-toggle="tab" data-value="PD">Protocol Deviations (<span id="domain_details-PD-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-7" data-toggle="tab" data-bs-toggle="tab" data-value="QUERY">Queries (<span id="domain_details-QUERY-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-8" data-toggle="tab" data-bs-toggle="tab" data-value="STUDCOMP">Study Completion (<span id="domain_details-STUDCOMP-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-9" data-toggle="tab" data-bs-toggle="tab" data-value="SUBJ">Subject Metadata (<span id="domain_details-SUBJ-count" class="shiny-text-output"></span>)</a>
      </li>
      <li>
      <a href="#tab-XXXX-10" data-toggle="tab" data-bs-toggle="tab" data-value="SDRGCOMP">Treatment Completion (<span id="domain_details-SDRGCOMP-count" class="shiny-text-output"></span>)</a>
      </li>
      </ul>
      <div class="tab-content" data-tabsetid="XXXX">
      <div class="tab-pane active" data-value="AE" id="tab-XXXX-1">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-AE-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-AE-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-AE-prevalence_plot-title">
      <span id="domain_details-AE-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-AE-prevalence_plot-category-select-select" id="domain_details-AE-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-AE-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-AE-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-AE-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-AE-prevalence_plot-key-Study" id="domain_details-AE-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-AE-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-AE-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-AE-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-AE-prevalence_plot-key-Group" id="domain_details-AE-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-AE-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-AE-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-AE-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-AE-prevalence_plot-key-Participant" id="domain_details-AE-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-AE-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-AE-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-AE-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-AE-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-AE-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-AE-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-AE-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-AE-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-AE-spinner" class="loader">Loading...</div>
      <div id="domain_details-AE-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-AE-gt-table"></div>
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
      <div class="tab-pane" data-value="DATACHG" id="tab-XXXX-2">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-DATACHG-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATACHG-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-DATACHG-prevalence_plot-title">
      <span id="domain_details-DATACHG-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATACHG-prevalence_plot-category-select-select" id="domain_details-DATACHG-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-DATACHG-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-DATACHG-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-DATACHG-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATACHG-prevalence_plot-key-Study" id="domain_details-DATACHG-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-DATACHG-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATACHG-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-DATACHG-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATACHG-prevalence_plot-key-Group" id="domain_details-DATACHG-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-DATACHG-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATACHG-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-DATACHG-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATACHG-prevalence_plot-key-Participant" id="domain_details-DATACHG-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-DATACHG-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATACHG-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-DATACHG-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-DATACHG-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-DATACHG-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-DATACHG-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATACHG-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-DATACHG-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-DATACHG-spinner" class="loader">Loading...</div>
      <div id="domain_details-DATACHG-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-DATACHG-gt-table"></div>
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
      <div class="tab-pane" data-value="DATAENT" id="tab-XXXX-3">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-DATAENT-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATAENT-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-DATAENT-prevalence_plot-title">
      <span id="domain_details-DATAENT-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATAENT-prevalence_plot-category-select-select" id="domain_details-DATAENT-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-DATAENT-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-DATAENT-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-DATAENT-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATAENT-prevalence_plot-key-Study" id="domain_details-DATAENT-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-DATAENT-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATAENT-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-DATAENT-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATAENT-prevalence_plot-key-Group" id="domain_details-DATAENT-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-DATAENT-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATAENT-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-DATAENT-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-DATAENT-prevalence_plot-key-Participant" id="domain_details-DATAENT-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-DATAENT-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-DATAENT-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-DATAENT-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-DATAENT-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-DATAENT-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-DATAENT-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATAENT-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-DATAENT-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-DATAENT-spinner" class="loader">Loading...</div>
      <div id="domain_details-DATAENT-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-DATAENT-gt-table"></div>
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
      <div class="tab-pane" data-value="ENROLL" id="tab-XXXX-4">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-ENROLL-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-ENROLL-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-ENROLL-prevalence_plot-title">
      <span id="domain_details-ENROLL-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-ENROLL-prevalence_plot-category-select-select" id="domain_details-ENROLL-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-ENROLL-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-ENROLL-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-ENROLL-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-ENROLL-prevalence_plot-key-Study" id="domain_details-ENROLL-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-ENROLL-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-ENROLL-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-ENROLL-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-ENROLL-prevalence_plot-key-Group" id="domain_details-ENROLL-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-ENROLL-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-ENROLL-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-ENROLL-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-ENROLL-prevalence_plot-key-Participant" id="domain_details-ENROLL-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-ENROLL-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-ENROLL-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-ENROLL-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-ENROLL-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-ENROLL-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-ENROLL-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-ENROLL-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-ENROLL-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-ENROLL-spinner" class="loader">Loading...</div>
      <div id="domain_details-ENROLL-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-ENROLL-gt-table"></div>
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
      <div class="tab-pane" data-value="LB" id="tab-XXXX-5">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-LB-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-LB-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-LB-prevalence_plot-title">
      <span id="domain_details-LB-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-LB-prevalence_plot-category-select-select" id="domain_details-LB-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-LB-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-LB-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-LB-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-LB-prevalence_plot-key-Study" id="domain_details-LB-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-LB-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-LB-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-LB-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-LB-prevalence_plot-key-Group" id="domain_details-LB-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-LB-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-LB-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-LB-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-LB-prevalence_plot-key-Participant" id="domain_details-LB-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-LB-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-LB-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-LB-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-LB-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-LB-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-LB-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-LB-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-LB-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-LB-spinner" class="loader">Loading...</div>
      <div id="domain_details-LB-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-LB-gt-table"></div>
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
      <div class="tab-pane" data-value="PD" id="tab-XXXX-6">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-PD-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-PD-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-PD-prevalence_plot-title">
      <span id="domain_details-PD-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-PD-prevalence_plot-category-select-select" id="domain_details-PD-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-PD-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-PD-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-PD-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-PD-prevalence_plot-key-Study" id="domain_details-PD-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-PD-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-PD-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-PD-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-PD-prevalence_plot-key-Group" id="domain_details-PD-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-PD-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-PD-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-PD-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-PD-prevalence_plot-key-Participant" id="domain_details-PD-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-PD-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-PD-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-PD-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-PD-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-PD-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-PD-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-PD-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-PD-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-PD-spinner" class="loader">Loading...</div>
      <div id="domain_details-PD-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-PD-gt-table"></div>
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
      <div class="tab-pane" data-value="QUERY" id="tab-XXXX-7">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-QUERY-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-QUERY-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-QUERY-prevalence_plot-title">
      <span id="domain_details-QUERY-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-QUERY-prevalence_plot-category-select-select" id="domain_details-QUERY-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-QUERY-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-QUERY-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-QUERY-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-QUERY-prevalence_plot-key-Study" id="domain_details-QUERY-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-QUERY-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-QUERY-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-QUERY-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-QUERY-prevalence_plot-key-Group" id="domain_details-QUERY-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-QUERY-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-QUERY-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-QUERY-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-QUERY-prevalence_plot-key-Participant" id="domain_details-QUERY-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-QUERY-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-QUERY-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-QUERY-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-QUERY-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-QUERY-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-QUERY-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-QUERY-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-QUERY-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-QUERY-spinner" class="loader">Loading...</div>
      <div id="domain_details-QUERY-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-QUERY-gt-table"></div>
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
      <div class="tab-pane" data-value="STUDCOMP" id="tab-XXXX-8">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-STUDCOMP-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-STUDCOMP-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-STUDCOMP-prevalence_plot-title">
      <span id="domain_details-STUDCOMP-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-STUDCOMP-prevalence_plot-category-select-select" id="domain_details-STUDCOMP-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-STUDCOMP-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-STUDCOMP-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-STUDCOMP-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-STUDCOMP-prevalence_plot-key-Study" id="domain_details-STUDCOMP-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-STUDCOMP-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-STUDCOMP-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-STUDCOMP-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-STUDCOMP-prevalence_plot-key-Group" id="domain_details-STUDCOMP-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-STUDCOMP-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-STUDCOMP-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-STUDCOMP-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-STUDCOMP-prevalence_plot-key-Participant" id="domain_details-STUDCOMP-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-STUDCOMP-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-STUDCOMP-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-STUDCOMP-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-STUDCOMP-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-STUDCOMP-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-STUDCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-STUDCOMP-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-STUDCOMP-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-STUDCOMP-spinner" class="loader">Loading...</div>
      <div id="domain_details-STUDCOMP-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-STUDCOMP-gt-table"></div>
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
      <div class="tab-pane" data-value="SUBJ" id="tab-XXXX-9">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-SUBJ-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SUBJ-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-SUBJ-prevalence_plot-title">
      <span id="domain_details-SUBJ-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SUBJ-prevalence_plot-category-select-select" id="domain_details-SUBJ-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-SUBJ-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-SUBJ-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-SUBJ-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SUBJ-prevalence_plot-key-Study" id="domain_details-SUBJ-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-SUBJ-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SUBJ-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-SUBJ-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SUBJ-prevalence_plot-key-Group" id="domain_details-SUBJ-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-SUBJ-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SUBJ-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-SUBJ-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SUBJ-prevalence_plot-key-Participant" id="domain_details-SUBJ-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-SUBJ-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SUBJ-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-SUBJ-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-SUBJ-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-SUBJ-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-SUBJ-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SUBJ-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-SUBJ-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-SUBJ-spinner" class="loader">Loading...</div>
      <div id="domain_details-SUBJ-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-SUBJ-gt-table"></div>
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
      <div class="tab-pane" data-value="SDRGCOMP" id="tab-XXXX-10">
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="4,8" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
      <div>
      <style>#domain_details-SDRGCOMP-prevalence_plot-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SDRGCOMP-prevalence_plot-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div id="domain_details-SDRGCOMP-prevalence_plot-title">
      <span id="domain_details-SDRGCOMP-prevalence_plot-category-select" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SDRGCOMP-prevalence_plot-category-select-select" id="domain_details-SDRGCOMP-prevalence_plot-category-select-select-label"></label>
      <div id="domain_details-SDRGCOMP-prevalence_plot-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="domain_details-SDRGCOMP-prevalence_plot-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>
      <span id="domain_details-SDRGCOMP-prevalence_plot-key" class="label-key-container"> by <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SDRGCOMP-prevalence_plot-key-Study" id="domain_details-SDRGCOMP-prevalence_plot-key-Study-label"></label>
      <div id="domain_details-SDRGCOMP-prevalence_plot-key-Study" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SDRGCOMP-prevalence_plot-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-study">
      <input type="checkbox" autocomplete="off" name="domain_details-SDRGCOMP-prevalence_plot-key-Study" value="Study"/> Study </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SDRGCOMP-prevalence_plot-key-Group" id="domain_details-SDRGCOMP-prevalence_plot-key-Group-label"></label>
      <div id="domain_details-SDRGCOMP-prevalence_plot-key-Group" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SDRGCOMP-prevalence_plot-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-group">
      <input type="checkbox" autocomplete="off" name="domain_details-SDRGCOMP-prevalence_plot-key-Group" value="Group"/> Group </button>
      </div>
      </div>
      </div>
      </div>
      <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="domain_details-SDRGCOMP-prevalence_plot-key-Participant" id="domain_details-SDRGCOMP-prevalence_plot-key-Participant-label"></label>
      <div id="domain_details-SDRGCOMP-prevalence_plot-key-Participant" class="checkbox-group-buttons">
      <div aria-labelledby="domain_details-SDRGCOMP-prevalence_plot-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
      <div class="btn-group btn-group-toggle" role="group">
      <button class="btn checkbtn btn-label-key-participant">
      <input type="checkbox" autocomplete="off" name="domain_details-SDRGCOMP-prevalence_plot-key-Participant" value="Participant"/> Participant </button>
      </div>
      </div>
      </div>
      </div>
      <bslib-tooltip id="domain_details-SDRGCOMP-prevalence_plot-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
      <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
      </bslib-tooltip>
      </span>
      </div>
      <div class="shiny-plot-output html-fill-item" id="domain_details-SDRGCOMP-prevalence_plot-plot-plot" style="width:100%;height:400px;"></div>
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
      <style>#domain_details-SDRGCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SDRGCOMP-card">
      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
      <div data-spinner-id="domain_details-SDRGCOMP-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
      <div class="load-container shiny-spinner-hidden load7">
      <div id="domain_details-SDRGCOMP-spinner" class="loader">Loading...</div>
      <div id="domain_details-SDRGCOMP-spinner__caption" class="shiny-spinner-caption">loading data...</div>
      </div>
      <div style="height:200px" class="shiny-spinner-placeholder"></div>
      <div class="shiny-html-output gt_shiny" id="domain_details-SDRGCOMP-gt-table"></div>
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
      </div>
      </div>

