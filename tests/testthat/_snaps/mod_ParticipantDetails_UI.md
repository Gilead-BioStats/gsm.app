# mod_ParticipantDetails_UI() returns the expected UI

    Code
      mod_ParticipantDetails_UI("participant_details")
    Output
      <div class="row">
        <div class="col-sm-6">
          <div id="participant_details-metadata" class="shiny-html-output"></div>
        </div>
        <div class="col-sm-6">
          <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
              <h5>Metric Summary</h5>
              <div id="participant_details-metric_summary-metric_list" class="shiny-html-output"></div>
            </div>
            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
              <h5>
                <span id="participant_details-metric_data-title" class="shiny-text-output"></span>
              </h5>
              <div id="participant_details-metric_data-table" style="width:100%;height:auto;" class="datatables html-widget html-widget-output shiny-report-size"></div>
            </div>
            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
          </div>
        </div>
      </div>

