# out_MainTabs generates the expected UI

    Code
      test_result
    Output
      [[1]]
      <div class="tab-pane" title="Study Overview" data-value="Study Overview">
        <div class="tabbable">
          <ul class="nav nav-underline shiny-tab-input" id="study_overview-nav_bar" data-tabsetid="XXXX">
            <li class="active">
              <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Overview Table">Overview Table</a>
            </li>
            <li>
              <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plots">Scatter Plots</a>
            </li>
          </ul>
          <div class="tab-content" data-tabsetid="XXXX">
            <div class="tab-pane active" data-value="Overview Table" id="tab-XXXX-1">
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study-overview-table-card">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div>
                    <span class="badge badge-red rounded-pill text-dark">3 Red KRIs</span>
                    <span class="badge badge-amber rounded-pill text-dark">3 Amber KRIs</span>
                  </div>
                  <div class="Widget_GroupOverview html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-site_overview_table" style="width:100%;height:100%;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
            <div class="tab-pane" data-value="Scatter Plots" id="tab-XXXX-2">
              <div class="bslib-grid bslib-mb-spacing html-fill-item" data-require-bs-caller="layout_column_wrap()" data-require-bs-version="5" id="study_overview-scatter" style="grid-template-columns:repeat(2, minmax(0, 1fr));grid-auto-rows:1fr;--bslib-grid-height:auto;--bslib-grid-height-mobile:auto;">
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-kri0001">
                    <div class="card-header">Adverse Event Rate</div>
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-kri0001-scatter_plot" style="width:100%;height:400px;"></div>
                    </div>
                    <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                      <template>Expand</template>
                      <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                    </bslib-tooltip>
                    <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-kri0002">
                    <div class="card-header">Serious Adverse Event Rate</div>
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-kri0002-scatter_plot" style="width:100%;height:400px;"></div>
                    </div>
                    <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                      <template>Expand</template>
                      <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                    </bslib-tooltip>
                    <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                  </div>
                </div>
              </div>
              <script>detectCardClicks('study_overview-scatter', 'study_overview-scatter-selectedScatterPlot')</script>
            </div>
          </div>
        </div>
      </div>
      
      [[2]]
      <div class="tab-pane" title="Metric Details" data-value="Metric Details">
        <div class="tabbable">
          <ul class="nav nav-underline shiny-tab-input" id="metric_details-selected_tab" data-tabsetid="XXXX">
            <li class="active">
              <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plot">Scatter Plot</a>
            </li>
            <li>
              <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Value)">Bar Chart (KRI Value)</a>
            </li>
            <li>
              <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="Bar Chart (KRI Score)">Bar Chart (KRI Score)</a>
            </li>
            <li>
              <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="Time Series">Time Series</a>
            </li>
            <li>
              <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="Analysis Output">Analysis Output</a>
            </li>
          </ul>
          <div class="tab-content" data-tabsetid="XXXX">
            <div class="tab-pane active" data-value="Scatter Plot" id="tab-XXXX-1">
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-scatter_plot">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-scatter_plot-scatter_plot" style="width:100%;height:400px;"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
            <div class="tab-pane" data-value="Bar Chart (KRI Value)" id="tab-XXXX-2">
              <div class="card mb-3" style="margin-top: 4px;">
                <div class="card-body">
                  <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_metric" style="width:100%;height:400px;"></div>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Bar Chart (KRI Score)" id="tab-XXXX-3">
              <div class="card mb-3" style="margin-top: 4px;">
                <div class="card-body">
                  <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_score" style="width:100%;height:400px;"></div>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Time Series" id="tab-XXXX-4">
              <div class="card mb-3" style="margin-top: 4px;">
                <div class="card-body">
                  <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-time_series" style="width:100%;height:400px;"></div>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Analysis Output" id="tab-XXXX-5">
              <div id="analysis_output_table" class="card mb-3" style="margin-top: 4px;">
                <div class="card-body">
                  <div id="metric_details-results" class="shiny-html-output"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="5,7" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container shinyjs-hide" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_site_metadata_list">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <h5>Site Metadata</h5>
                <div id="site_details-site_metadata_list" class="shiny-html-output"></div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_placeholder_site_metadata_list">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <h5>Site Metadata</h5>
                <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a site.</div>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container shinyjs-hide" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_participants">
              <div class="card-header">
                <h5>
                  <span id="site_details-participant_table_title" class="shiny-text-output"></span>
                </h5>
                <p class="card-subtitle">Select a subject below to drill-down</p>
              </div>
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <div class="datatables html-widget html-widget-output shiny-report-size html-fill-item" id="site_details-participants" style="width:100%;height:auto;"></div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_placeholder_participants">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <h5>Site Subjects</h5>
                <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a site.</div>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
          </div>
        </bslib-layout-columns>
      </div>
      
      [[3]]
      <div class="tab-pane" title="Participant Details" data-value="Participant Details">
        <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="6,6,12" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div id="participant_details-metadata" class="shiny-html-output"></div>
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="participant_details-metric_summary-card">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <h5>Metric Summary</h5>
                <div id="participant_details-metric_summary-metric_list" class="shiny-html-output"></div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="participant_details-domain-card">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                <h5>
                  <span id="participant_details-domain-title" class="shiny-text-output"></span>
                </h5>
                <div id="participant_details-domain-details" class="shiny-html-output"></div>
              </div>
              <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                <template>Expand</template>
                <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
              </bslib-tooltip>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
          </div>
        </bslib-layout-columns>
      </div>
      

