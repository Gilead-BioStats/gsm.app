# mod_MetricDetails_UI creates the expected UI

    Code
      test_result
    Output
      <div class="tabbable">
        <ul class="nav nav-underline shiny-tab-input" id="testID-selected_tab" data-tabsetid="XXXX">
          <li class="bslib-nav-item nav-item form-inline navbar-extras" id="metric-chooser-div">
            <div class="form-group shiny-input-container shiny-input-container-inline">
              <label class="control-label shiny-label-null" for="testID-metric" id="testID-metric-label"></label>
              <div id="testID-metric" class="virtual-select" style="display:inline-block;" data-update="change">
                <script type="application/json" data-for="testID-metric">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Adverse Event Rate","Data Change Rate","Delayed Data Entry Rate","Delayed Query Resolution Rate","Grade 3+ Lab Abnormality Rate","Important Protocol Deviation Rate","Non-Important Protocol Deviation Rate","Query Rate","Serious Adverse Event Rate","Study Discontinuation Rate","Treatment Discontinuation Rate"],"value":["Analysis_kri0001","Analysis_kri0011","Analysis_kri0010","Analysis_kri0009","Analysis_kri0005","Analysis_kri0004","Analysis_kri0003","Analysis_kri0008","Analysis_kri0002","Analysis_kri0006","Analysis_kri0007"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
              </div>
            </div>
          </li>
          <div class="bslib-nav-spacer"></div>
          <li class="active">
            <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plot">Scatter Plot</a>
          </li>
          <li>
            <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Value)">Bar Chart (KRI Value)</a>
          </li>
          <li>
            <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Score)">Bar Chart (KRI Score)</a>
          </li>
          <li>
            <a href="#tab-XXXX-6" data-toggle="tab" data-bs-toggle="tab" data-value="Time Series">Time Series</a>
          </li>
          <li>
            <a href="#tab-XXXX-7" data-toggle="tab" data-bs-toggle="tab" data-value="Analysis Output">Analysis Output</a>
          </li>
        </ul>
        <div class="tab-content" data-tabsetid="XXXX">
          <div class="tab-pane active" data-value="Scatter Plot" id="tab-XXXX-3">
            <div>
              <style>#testID-scatter_plot .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter_plot">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter_plot-plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="tab-pane" data-value="Bar Chart (KRI Value)" id="tab-XXXX-4">
            <div>
              <style>#testID-bar_chart_metric .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-bar_chart_metric">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="testID-bar_chart_metric-plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="tab-pane" data-value="Bar Chart (KRI Score)" id="tab-XXXX-5">
            <div>
              <style>#testID-bar_chart_score .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-bar_chart_score">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="testID-bar_chart_score-plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="tab-pane" data-value="Time Series" id="tab-XXXX-6">
            <div>
              <style>#testID-time_series .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-time_series">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="testID-time_series-plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="tab-pane" data-value="Analysis Output" id="tab-XXXX-7">
            <div>
              <style>#testID-analysis_output .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container MetricTable" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-analysis_output">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="shiny-html-output gt_shiny" id="testID-analysis_output-gt-table"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
        </div>
      </div>

