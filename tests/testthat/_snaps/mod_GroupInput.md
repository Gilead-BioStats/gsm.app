# mod_GroupInput_UI creates the expected UI with multiple levels

    Code
      test_result[[1]]
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="testing-level-select-label" for="testing-level-select">
            <strong>Group Level</strong>
          </label>
          <div id="testing-level-select" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-level-select">{"stateInput":true,"options":{"type":["vector"],"choices":["Site","Country"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

---

    Code
      test_result[[2]]
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="testing-group-select-label" for="testing-group-select">
            <strong>Site</strong>
          </label>
          <div id="testing-group-select" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-group-select">{"stateInput":true,"options":{"type":["vector"],"choices":["All"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

# mod_GroupInput_UI creates expected UI with a single level

    Code
      test_result[[1]]
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="testing-group-select-label" for="testing-group-select">
            <strong>Site</strong>
          </label>
          <div id="testing-group-select" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-group-select">{"stateInput":true,"options":{"type":["vector"],"choices":["All"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

