# mod_CascadingSelect_UI creates expected UI

    Code
      mod_CascadingSelect_UI("test", strLabel = "Test Label")
    Output
      <li class="bslib-nav-item nav-item form-inline navbar-extras">
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label" id="test-select-label" for="test-select">
            <strong>Test Label</strong>
          </label>
          <div id="test-select" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="test-select">{"stateInput":true,"options":{"type":["vector"],"choices":["All"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
      </li>

