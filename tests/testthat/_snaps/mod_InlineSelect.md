# mod_InlineSelect_UI produces the expected UI

    Code
      test_result
    Output
      <span id="test" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label shiny-label-null" for="test-select" id="test-select-label"></label>
      <div id="test-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="test-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>

---

    Code
      test_result
    Output
      <span id="test" class="inline-select">
      <div class="form-group shiny-input-container shiny-input-container-inline">
      <label class="control-label" id="test-select-label" for="test-select">Label</label>
      <div id="test-select" class="virtual-select" style="display:inline-block;" data-update="change">
      <script type="application/json" data-for="test-select">{"stateInput":true,"options":{"type":["vector"],"choices":["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
      </div>
      </div>
      </span>

