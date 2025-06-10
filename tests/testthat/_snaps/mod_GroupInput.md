# mod_GroupInput_UI creates the expected UI with multiple levels

    Code
      test_result[[1]]
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="testing-level-label" for="testing-level">
            <strong>Testing Level</strong>
          </label>
          <div id="testing-level" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-level">{"stateInput":true,"options":{"type":["vector"],"choices":["Site","Country"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

---

    Code
      test_result[[2]]
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="testing-group-label" for="testing-group">
            <strong>Site</strong>
          </label>
          <div id="testing-group" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-group">{"stateInput":true,"options":{"type":["vector"],"choices":["All","site1","site2","site3","site4","site5"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

