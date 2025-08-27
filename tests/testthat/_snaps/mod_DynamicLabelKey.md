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
      </span>

