# mod_TimeSeries_UI creates the expected UI

    Code
      test_result
    Output
      <div>
        <style>#myID .bslib-full-screen-enter { bottom: unset !important; }</style>
        <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="myID">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="myID-plot" style="width:100%;height:400px;"></div>
          </div>
          <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
            <template>Expand</template>
            <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
          </bslib-tooltip>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

# mod_TimeSeries_UI uses title when it's supplied

    Code
      test_result
    Output
      <div>
        <style>#myID .bslib-full-screen-enter { bottom: unset !important; }</style>
        <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="myID">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <h5>myTitle</h5>
            <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="myID-plot" style="width:100%;height:400px;"></div>
          </div>
          <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
            <template>Expand</template>
            <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
          </bslib-tooltip>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

# mod_TimeSeries_Server starts as expected

    Code
      substr(test_result, 1, 1000)
    Output
      {"x":{"id":"testingModTestingSeries-plot","dfResults":[{"GroupID":"0X4579","GroupLevel":"Site","Numerator":37,"Denominator":74,"Metric":0.5,"Score":2.7077,"Flag":1,"MetricID":"Analysis_kri0001","SnapshotDate":"2012-01-31","StudyID":"DEMO-001"},{"GroupID":"0X7258","GroupLevel":"Site","Numerator":12,"Denominator":36,"Metric":0.3333,"Score":0.7424,"Flag":0,"MetricID":"Analysis_kri0001","SnapshotDate":"2012-01-31","StudyID":"DEMO-001"},{"GroupID":"0X902","GroupLevel":"Site","Numerator":17,"Denominator":72,"Metric":0.2361,"Score":0.1044,"Flag":0,"MetricID":"Analysis_kri0001","SnapshotDate":"2012-01-31","StudyID":"DEMO-001"},{"GroupID":"0X1372","GroupLevel":"Site","Numerator":19,"Denominator":86,"Metric":0.2209,"Score":-0.0472,"Flag":0,"MetricID":"Analysis_kri0001","SnapshotDate":"2012-01-31","StudyID":"DEMO-001"},{"GroupID":"0X4178","GroupLevel":"Site","Numerator":20,"Denominator":96,"Metric":0.2083,"Score":-0.1913,"Flag":0,"MetricID":"Analysis_kri0001","SnapshotDate":"2012-01-31","StudyID" 

