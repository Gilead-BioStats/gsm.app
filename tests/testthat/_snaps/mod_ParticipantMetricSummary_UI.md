# mod_ParticipantMetricSummary_UI() returns the expected UI

    Code
      test_result
    Output
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_summary-card">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
          <h5>Metric Summary</h5>
          <div data-spinner-id="metric_summary-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
            <div class="load-container shiny-spinner-hidden load7">
              <div id="metric_summary-spinner" class="loader">Loading...</div>
            </div>
            <div style="height:400px" class="shiny-spinner-placeholder"></div>
            <div id="metric_summary-metric_list" class="shiny-html-output"></div>
          </div>
        </div>
        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
          <template>Expand</template>
          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
        </bslib-tooltip>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

