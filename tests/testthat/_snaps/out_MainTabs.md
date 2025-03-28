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
              <div>
                <style>#study_overview-table .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-table">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div id="study_overview-table-kri_counts">
                      <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="study_overview-table-kri_counts-red-toggle_pill" style="background-color: #FF5859; opacity: 0.5;">3 Red KRIs</a>
                      <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="study_overview-table-kri_counts-amber-toggle_pill" style="background-color: #FEAA02; opacity: 0.5;">3 Amber KRIs</a>
                    </div>
                    <div class="row gy-2">
                      <div class="Widget_GroupOverview html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-table-group_overview" style="width:100%;height:100%;"></div>
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
            </div>
            <div class="tab-pane" data-value="Scatter Plots" id="tab-XXXX-2">
              <div class="bslib-grid bslib-mb-spacing html-fill-item" data-require-bs-caller="layout_column_wrap()" data-require-bs-version="5" id="study_overview-scatter" style="grid-template-columns:repeat(2, minmax(0, 1fr));grid-auto-rows:1fr;--bslib-grid-height:auto;--bslib-grid-height-mobile:auto;">
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0001 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0001">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Adverse Event Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0001-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0002 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0002">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Serious Adverse Event Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0002-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0003 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0003">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Non-Important Protocol Deviation Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0003-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0004 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0004">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Important Protocol Deviation Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0004-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0005 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0005">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Grade 3+ Lab Abnormality Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0005-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0006 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0006">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Study Discontinuation Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0006-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0007 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0007">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Treatment Discontinuation Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0007-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0008 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0008">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Query Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0008-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0009 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0009">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Delayed Query Resolution Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0009-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0010 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0010">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Delayed Data Entry Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0010-plot" style="width:100%;height:400px;"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                  <div>
                    <style>#study_overview-scatter-Analysis_kri0011 .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="study_overview-scatter-Analysis_kri0011">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <h5>Data Change Rate</h5>
                        <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="study_overview-scatter-Analysis_kri0011-plot" style="width:100%;height:400px;"></div>
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
              <div>
                <style>#metric_details-scatter_plot .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-scatter_plot">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-scatter_plot-plot" style="width:100%;height:400px;"></div>
                  </div>
                  <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                    <template>Expand</template>
                    <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                  </bslib-tooltip>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Bar Chart (KRI Value)" id="tab-XXXX-2">
              <div>
                <style>#metric_details-bar_chart_metric .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-bar_chart_metric">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_metric-plot" style="width:100%;height:400px;"></div>
                  </div>
                  <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                    <template>Expand</template>
                    <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                  </bslib-tooltip>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Bar Chart (KRI Score)" id="tab-XXXX-3">
              <div>
                <style>#metric_details-bar_chart_score .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-bar_chart_score">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="Widget_BarChart html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-bar_chart_score-plot" style="width:100%;height:400px;"></div>
                  </div>
                  <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                    <template>Expand</template>
                    <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                  </bslib-tooltip>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Time Series" id="tab-XXXX-4">
              <div>
                <style>#metric_details-time_series .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-time_series">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="Widget_TimeSeries html-widget html-widget-output shiny-report-size html-fill-item" id="metric_details-time_series-plot" style="width:100%;height:400px;"></div>
                  </div>
                  <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                    <template>Expand</template>
                    <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                  </bslib-tooltip>
                  <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                </div>
              </div>
            </div>
            <div class="tab-pane" data-value="Analysis Output" id="tab-XXXX-5">
              <div>
                <style>#metric_details-analysis_output .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container MetricTable" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="metric_details-analysis_output">
                  <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                    <div class="shiny-html-output gt_shiny" id="metric_details-analysis_output-gt-table"></div>
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
        <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="5,7" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div id="site_details-card_site_metadata_list" class="shinyjs-hide">
              <div>
                <style>#site_details-card_site_metadata_list-contents .bslib-full-screen-enter { bottom: unset !important; }</style>
                <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-card_site_metadata_list-contents">
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
              </div>
            </div>
            <div>
              <style>#site_details-card_placeholder_site_metadata_list .bslib-full-screen-enter { bottom: unset !important; }</style>
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
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div>
              <style>#site_details-participants-gt_card .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="site_details-participants-gt_card">
                <div class="card-header">
                  <h5>
                    <span id="site_details-participants-title" class="shiny-text-output"></span>
                  </h5>
                  <div id="site_details-participants-subtitle" class="shiny-html-output"></div>
                </div>
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div class="shiny-html-output gt_shiny" id="site_details-participants-gt-table"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
        </bslib-layout-columns>
      </div>
      
      [[3]]
      <div class="tab-pane" title="Domain Details" data-value="Domain Details">
        <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" col-widths-sm="3,9" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div>
              <style>#domain_details-counts-card .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-counts-card">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <h5>Domain Summary</h5>
                  <div id="domain_details-counts-domain_list" class="shiny-html-output"></div>
                </div>
                <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                  <template>Expand</template>
                  <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                </bslib-tooltip>
                <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
              </div>
            </div>
          </div>
          <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
            <div class="tabbable">
              <ul class="nav nav-underline shiny-tab-input" id="domain_details-selected_tab" data-tabsetid="XXXX">
                <li class="active">
                  <a href="#tab-XXXX-1" data-toggle="tab" data-bs-toggle="tab" data-value="AE">Adverse Events</a>
                </li>
                <li>
                  <a href="#tab-XXXX-2" data-toggle="tab" data-bs-toggle="tab" data-value="DATACHG">Data Changes</a>
                </li>
                <li>
                  <a href="#tab-XXXX-3" data-toggle="tab" data-bs-toggle="tab" data-value="DATAENT">Data Entry</a>
                </li>
                <li>
                  <a href="#tab-XXXX-4" data-toggle="tab" data-bs-toggle="tab" data-value="ENROLL">Enrollment</a>
                </li>
                <li>
                  <a href="#tab-XXXX-5" data-toggle="tab" data-bs-toggle="tab" data-value="LB">Lab</a>
                </li>
                <li>
                  <a href="#tab-XXXX-6" data-toggle="tab" data-bs-toggle="tab" data-value="PD">Protocol Deviations</a>
                </li>
                <li>
                  <a href="#tab-XXXX-7" data-toggle="tab" data-bs-toggle="tab" data-value="QUERY">Queries</a>
                </li>
                <li>
                  <a href="#tab-XXXX-8" data-toggle="tab" data-bs-toggle="tab" data-value="STUDCOMP">Study Completion</a>
                </li>
                <li>
                  <a href="#tab-XXXX-9" data-toggle="tab" data-bs-toggle="tab" data-value="SUBJ">Subject Metadata</a>
                </li>
                <li>
                  <a href="#tab-XXXX-10" data-toggle="tab" data-bs-toggle="tab" data-value="SDRGCOMP">Treatment Completion</a>
                </li>
              </ul>
              <div class="tab-content" data-tabsetid="XXXX">
                <div class="tab-pane active" data-value="AE" id="tab-XXXX-1">
                  <div>
                    <style>#domain_details-AE-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-AE-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-AE-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="DATACHG" id="tab-XXXX-2">
                  <div>
                    <style>#domain_details-DATACHG-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATACHG-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-DATACHG-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="DATAENT" id="tab-XXXX-3">
                  <div>
                    <style>#domain_details-DATAENT-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATAENT-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-DATAENT-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="ENROLL" id="tab-XXXX-4">
                  <div>
                    <style>#domain_details-ENROLL-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-ENROLL-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-ENROLL-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="LB" id="tab-XXXX-5">
                  <div>
                    <style>#domain_details-LB-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-LB-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-LB-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="PD" id="tab-XXXX-6">
                  <div>
                    <style>#domain_details-PD-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-PD-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-PD-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="QUERY" id="tab-XXXX-7">
                  <div>
                    <style>#domain_details-QUERY-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-QUERY-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-QUERY-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="STUDCOMP" id="tab-XXXX-8">
                  <div>
                    <style>#domain_details-STUDCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-STUDCOMP-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-STUDCOMP-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="SUBJ" id="tab-XXXX-9">
                  <div>
                    <style>#domain_details-SUBJ-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SUBJ-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-SUBJ-gt-table"></div>
                      </div>
                      <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
                        <template>Expand</template>
                        <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
                      </bslib-tooltip>
                      <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" data-value="SDRGCOMP" id="tab-XXXX-10">
                  <div>
                    <style>#domain_details-SDRGCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                    <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SDRGCOMP-card">
                      <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                        <div class="shiny-html-output gt_shiny" id="domain_details-SDRGCOMP-gt-table"></div>
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
          </div>
        </bslib-layout-columns>
      </div>
      

