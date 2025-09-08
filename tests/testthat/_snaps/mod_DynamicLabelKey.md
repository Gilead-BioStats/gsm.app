# mod_DynamicLabelKey_UI creates expected UI

    Code
      mod_DynamicLabelKey_UI("test")
    Output
      <span id="test" class="label-key-container">
        by
        <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="test-Study" id="test-Study-label"></label>
          <div id="test-Study" class="checkbox-group-buttons">
            <div aria-labelledby="test-Study-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
              <div class="btn-group btn-group-toggle" role="group">
                <button class="btn checkbtn btn-label-key-study">
                  <input type="checkbox" autocomplete="off" name="test-Study" value="Study"/>
                  Study
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="test-Group" id="test-Group-label"></label>
          <div id="test-Group" class="checkbox-group-buttons">
            <div aria-labelledby="test-Group-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
              <div class="btn-group btn-group-toggle" role="group">
                <button class="btn checkbtn btn-label-key-group">
                  <input type="checkbox" autocomplete="off" name="test-Group" value="Group"/>
                  Group
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group shiny-input-container shiny-input-checkboxgroup shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="test-Participant" id="test-Participant-label"></label>
          <div id="test-Participant" class="checkbox-group-buttons">
            <div aria-labelledby="test-Participant-label" class="btn-group btn-group-container-sw" data-toggle="buttons" role="group">
              <div class="btn-group btn-group-toggle" role="group">
                <button class="btn checkbtn btn-label-key-participant">
                  <input type="checkbox" autocomplete="off" name="test-Participant" value="Participant"/>
                  Participant
                </button>
              </div>
            </div>
          </div>
        </div>
        <bslib-tooltip id="test-help" placement="right" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
          <template>Click Study, Group, or Participant buttons to toggle display of those bars. Gray buttons require a Site or Participant selection in the main app menu at the top-right.</template>
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-question-circle " style="height:1em;width:1em;fill:currentColor;vertical-align:-0.125em;" aria-hidden="true" role="img" ><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"></path></svg>
        </bslib-tooltip>
      </span>

