# mod_PrevalencePlotCard_UI creates expected UI

    Code
      mod_PrevalencePlotCard_UI("test")
    Output
      <div>
        <style>#test-card .bslib-full-screen-enter { bottom: unset !important; }</style>
        <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="test-card">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <div id="test-title">
              <span id="test-category-select" class="inline-select">
                <div class="form-group shiny-input-container shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="test-category-select-select" id="test-category-select-select-label"></label>
                  <div id="test-category-select-select" class="virtual-select" style="display:inline-block;" data-update="change">
                    <script type="application/json" data-for="test-category-select-select">{"stateInput":true,"options":{"type":["vector"],"choices":[""]},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                  </div>
                </div>
              </span>
              <span id="test-key" class="label-key-container">
                by
                <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="test-key-Study" id="test-key-Study-label"></label>
                  <div id="test-key-Study" class="checkbox-group-buttons">
                    <div aria-labelledby="test-key-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                      <div class="btn-group btn-group-toggle" role="group">
                        <button class="btn checkbtn btn-label-key-study">
                          <input type="checkbox" autocomplete="off" name="test-key-Study" value="Study"/>
                          Study
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="test-key-Group" id="test-key-Group-label"></label>
                  <div id="test-key-Group" class="checkbox-group-buttons">
                    <div aria-labelledby="test-key-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                      <div class="btn-group btn-group-toggle" role="group">
                        <button class="btn checkbtn btn-label-key-group">
                          <input type="checkbox" autocomplete="off" name="test-key-Group" value="Group"/>
                          Group
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="test-key-Participant" id="test-key-Participant-label"></label>
                  <div id="test-key-Participant" class="checkbox-group-buttons">
                    <div aria-labelledby="test-key-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
                      <div class="btn-group btn-group-toggle" role="group">
                        <button class="btn checkbtn btn-label-key-participant">
                          <input type="checkbox" autocomplete="off" name="test-key-Participant" value="Participant"/>
                          Participant
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <bslib-tooltip id="test-key-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
                </bslib-tooltip>
              </span>
            </div>
            <div class="bars html-widget html-widget-output shiny-report-size html-fill-item" id="test-plot-plot" style="width:100%;height:500px;"></div>
          </div>
          <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
            <template>Expand</template>
            <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
          </bslib-tooltip>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

