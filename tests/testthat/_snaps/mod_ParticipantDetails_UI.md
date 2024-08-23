# mod_ParticipantDetails_UI() returns the expected UI

    Code
      mod_ParticipantDetails_UI("participant_details")
    Output
      <div class="row">
        <div id="participant_details-metadata" class="shiny-html-output"></div>
        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3">
          <div id="participant_details-card_placeholder_participant_metric_summary_data" class="card mb-3">
            <div class="card-body">
              <h5 class="card-title">Metric Summary</h5>
              <hr/>
              <div class="card placeholder">
                <div class="card-body">
                  <div class="card-text">Please select a participant.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3 shinyjs-hide" id="participant_details-card_participant_metric_summary_data">
            <div class="card-body">
              <h5 class="card-title">Metric Summary</h5>
              <hr/>
              <div id="participant_details-participant_metric_summary" class="shiny-html-output"></div>
            </div>
          </div>
        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 col-xxl-9">
          <div id="participant_details-card_placeholder_participant_domain_data" class="card mb-3">
            <div class="card-body">
              <h5 class="card-title">Participant Domain</h5>
              <hr/>
              <div class="card placeholder">
                <div class="card-body">
                  <div class="card-text">Please select a participant.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3 shinyjs-hide" id="participant_details-card_placeholder_participant_domain_data_no_metric">
            <div class="card-body">
              <h5 class="card-title">Participant Domain</h5>
              <hr/>
              <div class="card placeholder">
                <div class="card-body">
                  <div class="card-text">Please select a metric in the Metric Summary Card above.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3 shinyjs-hide" id="participant_details-card_participant_domain_data">
            <div class="card-body">
              <h5 class="card-title">Participant Domain</h5>
              <div id="participant_details-show_hide_columns" class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline" role="radiogroup" aria-labelledby="participant_details-show_hide_columns-label">
                <label class="control-label" id="participant_details-show_hide_columns-label" for="participant_details-show_hide_columns">Show all columns?</label>
                <div class="shiny-options-group">
                  <label class="radio-inline">
                    <input type="radio" name="participant_details-show_hide_columns" value="Hide" checked="checked"/>
                    <span>Hide</span>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="participant_details-show_hide_columns" value="Show"/>
                    <span>Show</span>
                  </label>
                </div>
              </div>
              <div id="participant_details-domain_data_table" class="shiny-text-output"></div>
            </div>
          </div>
        </div>
      </div>

