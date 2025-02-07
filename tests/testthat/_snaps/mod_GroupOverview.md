# mod_GroupOverview_UI creates the expected UI

    Code
      test_result
    Output
      <div>
        <style>#test_id .bslib-full-screen-enter { bottom: unset !important; }</style>
        <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="test_id">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <div id="test_id-kri_counts">
              <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="test_id-kri_counts-red-toggle_pill" style="background-color: #FF5859; opacity: 0.5;">24 Red KRIs</a>
              <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="test_id-kri_counts-amber-toggle_pill" style="background-color: #FEAA02; opacity: 0.5;">22 Amber KRIs</a>
            </div>
            <div class="row gy-2">
              <div class="Widget_GroupOverview html-widget html-widget-output shiny-report-size html-fill-item" id="test_id-group_overview" style="width:100%;height:100%;"></div>
              <div class="footnote">Click cells for associated risk signal details.</div>
            </div>
          </div>
          <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
            <template>Expand</template>
            <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
          </bslib-tooltip>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

