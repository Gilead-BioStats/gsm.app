# out_MainTabs generates the expected UI

    Code
      test_result
    Output
      <body class="bslib-page-fill bslib-gap-spacing bslib-flow-mobile html-fill-container bslib-page-navbar has-page-sidebar" style="padding:0px;gap:0px;">
        <nav class="navbar navbar-default navbar-static-top" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-XXXX" data-bs-toggle="collapse" data-bs-target="#navbar-collapse-XXXX">
                <span class="sr-only visually-hidden">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <span class="navbar-brand">GSM Deep Dive</span>
            </div>
            <div class="navbar-collapse collapse" id="navbar-collapse-XXXX">
              <ul class="nav navbar-nav nav-underline shiny-tab-input" id="primary_nav_bar" data-tabsetid="XXXX">
                <li class="active">
                  <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Study Overview">Study Overview</a>
                </li>
                <li>
                  <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Metric Details">Metric Details</a>
                </li>
                <li>
                  <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="Participant Details">Participant Details</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="html-fill-item html-fill-container">
          <div class="bslib-sidebar-layout bslib-mb-spacing html-fill-item" data-bslib-sidebar-border="false" data-bslib-sidebar-border-radius="false" data-bslib-sidebar-init="TRUE" data-collapsible-desktop="true" data-collapsible-mobile="false" data-open-desktop="open" data-open-mobile="always" data-require-bs-caller="layout_sidebar()" data-require-bs-version="5" style="--_sidebar-width:400px;">
            <div class="main">
              <main class="bslib-page-main bslib-gap-spacing html-fill-item html-fill-container">
                <div class="tab-content" data-tabsetid="XXXX">
                  <div class="tab-pane active" data-value="Study Overview" id="tab-XXXX-1">
                    <div class="tabbable">
                      <ul class="nav nav-underline" data-tabsetid="XXXX">
                        <li class="active">
                          <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="Overview Table">Overview Table</a>
                        </li>
                        <li>
                          <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="Scatter Plots">Scatter Plots</a>
                        </li>
                      </ul>
                      <div class="tab-content" data-tabsetid="XXXX">
                        <div class="tab-pane active" data-value="Overview Table" id="tab-XXXX-1">
                          <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="bslib-card-XXXX">
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
                  <div class="tab-pane" data-value="Metric Details" id="tab-XXXX-2">
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
                  <div class="tab-pane" data-value="Participant Details" id="tab-XXXX-3">
                    <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="6,6,12" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
                      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                        <div id="participant_details-metadata" class="shiny-html-output"></div>
                      </div>
                      <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                        <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="bslib-card-XXXX">
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
                        <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="bslib-card-XXXX">
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
                </div>
              </main>
            </div>
            <aside id="sidebar" class="sidebar bslib-sidebar-input" hidden>
              <div class="sidebar-content bslib-gap-spacing">
                <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                  <div class="card-header">
                    <h5></h5>
                    <h6 class="card-subtitle mb-2 text-muted mb-2">Protocol Nickname</h6>
                    <h6 class="card-subtitle mb-2 text-muted">2019-11-01</h6>
                  </div>
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="metadata-list-item">
                      <div class="metadata-list-item-label">Indication</div>
                      <div class="metadata-list-item-spacer"></div>
                      <div class="metadata-list-item-value">Protocol Indication</div>
                    </div>
                    <div class="metadata-list-item">
                      <div class="metadata-list-item-label">Therapeutic Area</div>
                      <div class="metadata-list-item-spacer"></div>
                      <div class="metadata-list-item-value">Therapeutic Area</div>
                    </div>
                    <div class="metadata-list-item">
                      <div class="metadata-list-item-label">Phase</div>
                      <div class="metadata-list-item-spacer"></div>
                      <div class="metadata-list-item-value">P3</div>
                    </div>
                    <div class="metadata-list-item">
                      <div class="metadata-list-item-label">Sites</div>
                      <div class="metadata-list-item-spacer"></div>
                      <div class="metadata-list-item-value">190</div>
                    </div>
                    <div class="metadata-list-item">
                      <div class="metadata-list-item-label">Subjects</div>
                      <div class="metadata-list-item-spacer"></div>
                      <div class="metadata-list-item-value">1301</div>
                    </div>
                  </div>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
                <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container overflow-on" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container overflow-on" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="form-group shiny-input-container" style="width:100%;">
                      <label class="control-label" id="metric-label" for="metric">
                        <strong>Metric</strong>
                      </label>
                      <div>
                        <select id="metric" class="shiny-input-select"><option value="kri0001" selected>Adverse Event Rate</option>
      <option value="kri0002">Serious Adverse Event Rate</option></select>
                        <script type="application/json" data-for="metric" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
                      </div>
                    </div>
                    <div class="form-group shiny-input-container" style="width:100%;">
                      <label class="control-label" id="site-label" for="site">
                        <strong>Site</strong>
                      </label>
                      <div>
                        <select id="site" class="shiny-input-select"><option value="None" selected>None</option>
      <option value="0X001">0X001</option>
      <option value="0X002">0X002</option>
      <option value="0X003">0X003</option>
      <option value="0X004">0X004</option>
      <option value="0X005">0X005</option>
      <option value="0X006">0X006</option>
      <option value="0X007">0X007</option>
      <option value="0X008">0X008</option>
      <option value="0X010">0X010</option>
      <option value="0X011">0X011</option>
      <option value="0X012">0X012</option>
      <option value="0X013">0X013</option>
      <option value="0X014">0X014</option>
      <option value="0X015">0X015</option>
      <option value="0X016">0X016</option>
      <option value="0X018">0X018</option>
      <option value="0X020">0X020</option>
      <option value="0X021">0X021</option>
      <option value="0X022">0X022</option>
      <option value="0X023">0X023</option>
      <option value="0X024">0X024</option>
      <option value="0X025">0X025</option>
      <option value="0X026">0X026</option>
      <option value="0X027">0X027</option>
      <option value="0X028">0X028</option>
      <option value="0X029">0X029</option>
      <option value="0X030">0X030</option>
      <option value="0X031">0X031</option>
      <option value="0X033">0X033</option>
      <option value="0X034">0X034</option>
      <option value="0X035">0X035</option>
      <option value="0X036">0X036</option>
      <option value="0X037">0X037</option>
      <option value="0X038">0X038</option>
      <option value="0X039">0X039</option>
      <option value="0X040">0X040</option>
      <option value="0X041">0X041</option>
      <option value="0X042">0X042</option>
      <option value="0X043">0X043</option>
      <option value="0X045">0X045</option>
      <option value="0X046">0X046</option>
      <option value="0X047">0X047</option>
      <option value="0X048">0X048</option>
      <option value="0X049">0X049</option>
      <option value="0X050">0X050</option>
      <option value="0X051">0X051</option>
      <option value="0X052">0X052</option>
      <option value="0X054">0X054</option>
      <option value="0X055">0X055</option>
      <option value="0X056">0X056</option>
      <option value="0X057">0X057</option>
      <option value="0X058">0X058</option>
      <option value="0X059">0X059</option>
      <option value="0X061">0X061</option>
      <option value="0X062">0X062</option>
      <option value="0X063">0X063</option>
      <option value="0X064">0X064</option>
      <option value="0X065">0X065</option>
      <option value="0X066">0X066</option>
      <option value="0X068">0X068</option>
      <option value="0X069">0X069</option>
      <option value="0X072">0X072</option>
      <option value="0X073">0X073</option>
      <option value="0X074">0X074</option>
      <option value="0X075">0X075</option>
      <option value="0X076">0X076</option>
      <option value="0X077">0X077</option>
      <option value="0X078">0X078</option>
      <option value="0X079">0X079</option>
      <option value="0X080">0X080</option>
      <option value="0X081">0X081</option>
      <option value="0X082">0X082</option>
      <option value="0X083">0X083</option>
      <option value="0X084">0X084</option>
      <option value="0X085">0X085</option>
      <option value="0X086">0X086</option>
      <option value="0X087">0X087</option>
      <option value="0X088">0X088</option>
      <option value="0X089">0X089</option>
      <option value="0X090">0X090</option>
      <option value="0X091">0X091</option>
      <option value="0X092">0X092</option>
      <option value="0X093">0X093</option>
      <option value="0X094">0X094</option>
      <option value="0X095">0X095</option>
      <option value="0X096">0X096</option>
      <option value="0X097">0X097</option>
      <option value="0X098">0X098</option>
      <option value="0X099">0X099</option>
      <option value="0X100">0X100</option>
      <option value="0X101">0X101</option>
      <option value="0X102">0X102</option>
      <option value="0X103">0X103</option>
      <option value="0X104">0X104</option>
      <option value="0X105">0X105</option>
      <option value="0X106">0X106</option>
      <option value="0X107">0X107</option>
      <option value="0X108">0X108</option>
      <option value="0X109">0X109</option>
      <option value="0X110">0X110</option>
      <option value="0X113">0X113</option>
      <option value="0X114">0X114</option>
      <option value="0X115">0X115</option>
      <option value="0X116">0X116</option>
      <option value="0X117">0X117</option>
      <option value="0X118">0X118</option>
      <option value="0X119">0X119</option>
      <option value="0X120">0X120</option>
      <option value="0X121">0X121</option>
      <option value="0X122">0X122</option>
      <option value="0X123">0X123</option>
      <option value="0X124">0X124</option>
      <option value="0X125">0X125</option>
      <option value="0X126">0X126</option>
      <option value="0X127">0X127</option>
      <option value="0X129">0X129</option>
      <option value="0X130">0X130</option>
      <option value="0X131">0X131</option>
      <option value="0X132">0X132</option>
      <option value="0X133">0X133</option>
      <option value="0X134">0X134</option>
      <option value="0X135">0X135</option>
      <option value="0X136">0X136</option>
      <option value="0X137">0X137</option>
      <option value="0X138">0X138</option>
      <option value="0X139">0X139</option>
      <option value="0X140">0X140</option>
      <option value="0X141">0X141</option>
      <option value="0X142">0X142</option>
      <option value="0X143">0X143</option>
      <option value="0X144">0X144</option>
      <option value="0X147">0X147</option>
      <option value="0X148">0X148</option>
      <option value="0X149">0X149</option>
      <option value="0X151">0X151</option>
      <option value="0X152">0X152</option>
      <option value="0X153">0X153</option>
      <option value="0X154">0X154</option>
      <option value="0X155">0X155</option>
      <option value="0X156">0X156</option>
      <option value="0X157">0X157</option>
      <option value="0X159">0X159</option>
      <option value="0X160">0X160</option>
      <option value="0X161">0X161</option>
      <option value="0X162">0X162</option>
      <option value="0X163">0X163</option>
      <option value="0X164">0X164</option>
      <option value="0X165">0X165</option>
      <option value="0X166">0X166</option>
      <option value="0X167">0X167</option>
      <option value="0X168">0X168</option>
      <option value="0X169">0X169</option>
      <option value="0X170">0X170</option>
      <option value="0X171">0X171</option>
      <option value="0X172">0X172</option>
      <option value="0X173">0X173</option>
      <option value="0X174">0X174</option>
      <option value="0X175">0X175</option>
      <option value="0X176">0X176</option>
      <option value="0X177">0X177</option>
      <option value="0X178">0X178</option>
      <option value="0X179">0X179</option>
      <option value="0X180">0X180</option>
      <option value="0X181">0X181</option>
      <option value="0X182">0X182</option>
      <option value="0X183">0X183</option>
      <option value="0X184">0X184</option>
      <option value="0X186">0X186</option>
      <option value="0X188">0X188</option>
      <option value="0X189">0X189</option>
      <option value="0X190">0X190</option>
      <option value="X044X">X044X</option>
      <option value="X060X">X060X</option>
      <option value="X067X">X067X</option>
      <option value="X185X">X185X</option>
      <option value="X187X">X187X</option></select>
                        <script type="application/json" data-for="site" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
                      </div>
                    </div>
                    <div class="form-group shiny-input-container" style="width:100%;">
                      <label class="control-label" id="participant-label" for="participant">
                        <strong>Participant</strong>
                      </label>
                      <div>
                        <select class="shiny-input-select form-control" id="participant"></select>
                        <script type="application/json" data-for="participant">{"maxOptions":10,"plugins":["selectize-plugin-a11y"]}</script>
                      </div>
                    </div>
                    <button class="btn btn-default action-button btn btn-primary btn-sm" id="reset" type="button">Reset All</button>
                  </div>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
            </aside>
            <button class="collapse-toggle" type="button" title="Toggle sidebar" aria-expanded="true" aria-controls="sidebar"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="bi bi-chevron-left collapse-icon" style="fill:currentColor;" aria-hidden="true" role="img" ><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path></svg></button>
            <script data-bslib-sidebar-init>bslib.Sidebar.initCollapsibleAll()</script>
          </div>
        </div>
      </body>

