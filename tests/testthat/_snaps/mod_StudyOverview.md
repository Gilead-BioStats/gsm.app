# mod_StudyOverview_UI creates the expected UI

    Code
      test_result
    Output
      <div class="tabbable">
        <ul class="nav nav-underline shiny-tab-input" id="testID-nav_bar" data-tabsetid="XXXX">
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
              <style>#testID-table .bslib-full-screen-enter { bottom: unset !important; }</style>
              <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-table">
                <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                  <div id="testID-table-kri_counts">
                    <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="testID-table-kri_counts-red-toggle_pill" style="background-color: #FF5859; opacity: 0.5;">24 Red KRIs</a>
                    <a class="action-button badge rounded-pill toggle-pill text-dark fs-6 p-2" href="#" id="testID-table-kri_counts-amber-toggle_pill" style="background-color: #FEAA02; opacity: 0.5;">22 Amber KRIs</a>
                  </div>
                  <div class="row gy-2">
                    <div class="Widget_GroupOverview html-widget html-widget-output shiny-report-size html-fill-item" id="testID-table-group_overview" style="width:100%;height:100%;"></div>
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
            <div class="bslib-grid bslib-mb-spacing html-fill-item" data-require-bs-caller="layout_column_wrap()" data-require-bs-version="5" id="testID-scatter" style="grid-template-columns:repeat(2, minmax(0, 1fr));grid-auto-rows:1fr;--bslib-grid-height:auto;--bslib-grid-height-mobile:auto;">
              <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
                <div>
                  <style>#testID-scatter-Analysis_kri0001 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0001">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Adverse Event Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0001-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0002 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0002">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Serious Adverse Event Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0002-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0003 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0003">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Non-Important Protocol Deviation Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0003-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0004 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0004">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Important Protocol Deviation Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0004-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0005 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0005">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Grade 3+ Lab Abnormality Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0005-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0006 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0006">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Study Discontinuation Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0006-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0007 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0007">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Treatment Discontinuation Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0007-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0008 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0008">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Query Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0008-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0009 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0009">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Delayed Query Resolution Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0009-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0010 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0010">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Delayed Data Entry Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0010-plot" style="width:100%;height:400px;"></div>
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
                  <style>#testID-scatter-Analysis_kri0011 .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container chart" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testID-scatter-Analysis_kri0011">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <h5>Data Change Rate</h5>
                      <div class="Widget_ScatterPlot html-widget html-widget-output shiny-report-size html-fill-item" id="testID-scatter-Analysis_kri0011-plot" style="width:100%;height:400px;"></div>
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
            <script>detectCardClicks('testID-scatter', 'testID-scatter-selectedScatterPlot')</script>
          </div>
        </div>
      </div>

