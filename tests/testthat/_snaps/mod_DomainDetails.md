# mod_DomainDetails_UI() returns the expected UI

    Code
      test_result
    Output
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
                      <div data-spinner-id="domain_details-AE-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-AE-spinner" class="loader">Loading...</div>
                          <div id="domain_details-AE-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-AE-gt-table"></div>
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
              <div class="tab-pane" data-value="DATACHG" id="tab-XXXX-2">
                <div>
                  <style>#domain_details-DATACHG-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATACHG-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-DATACHG-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-DATACHG-spinner" class="loader">Loading...</div>
                          <div id="domain_details-DATACHG-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-DATACHG-gt-table"></div>
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
              <div class="tab-pane" data-value="DATAENT" id="tab-XXXX-3">
                <div>
                  <style>#domain_details-DATAENT-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-DATAENT-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-DATAENT-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-DATAENT-spinner" class="loader">Loading...</div>
                          <div id="domain_details-DATAENT-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-DATAENT-gt-table"></div>
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
              <div class="tab-pane" data-value="ENROLL" id="tab-XXXX-4">
                <div>
                  <style>#domain_details-ENROLL-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-ENROLL-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-ENROLL-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-ENROLL-spinner" class="loader">Loading...</div>
                          <div id="domain_details-ENROLL-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-ENROLL-gt-table"></div>
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
              <div class="tab-pane" data-value="LB" id="tab-XXXX-5">
                <div>
                  <style>#domain_details-LB-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-LB-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-LB-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-LB-spinner" class="loader">Loading...</div>
                          <div id="domain_details-LB-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-LB-gt-table"></div>
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
              <div class="tab-pane" data-value="PD" id="tab-XXXX-6">
                <div>
                  <style>#domain_details-PD-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-PD-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-PD-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-PD-spinner" class="loader">Loading...</div>
                          <div id="domain_details-PD-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-PD-gt-table"></div>
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
              <div class="tab-pane" data-value="QUERY" id="tab-XXXX-7">
                <div>
                  <style>#domain_details-QUERY-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-QUERY-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-QUERY-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-QUERY-spinner" class="loader">Loading...</div>
                          <div id="domain_details-QUERY-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-QUERY-gt-table"></div>
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
              <div class="tab-pane" data-value="STUDCOMP" id="tab-XXXX-8">
                <div>
                  <style>#domain_details-STUDCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-STUDCOMP-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-STUDCOMP-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-STUDCOMP-spinner" class="loader">Loading...</div>
                          <div id="domain_details-STUDCOMP-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-STUDCOMP-gt-table"></div>
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
              <div class="tab-pane" data-value="SUBJ" id="tab-XXXX-9">
                <div>
                  <style>#domain_details-SUBJ-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SUBJ-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-SUBJ-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-SUBJ-spinner" class="loader">Loading...</div>
                          <div id="domain_details-SUBJ-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-SUBJ-gt-table"></div>
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
              <div class="tab-pane" data-value="SDRGCOMP" id="tab-XXXX-10">
                <div>
                  <style>#domain_details-SDRGCOMP-card .bslib-full-screen-enter { bottom: unset !important; }</style>
                  <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="domain_details-SDRGCOMP-card">
                    <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
                      <div data-spinner-id="domain_details-SDRGCOMP-spinner" class="shiny-spinner-output-container shiny-spinner-hideui">
                        <div class="load-container shiny-spinner-hidden load7">
                          <div id="domain_details-SDRGCOMP-spinner" class="loader">Loading...</div>
                          <div id="domain_details-SDRGCOMP-spinner__caption" class="shiny-spinner-caption">loading data...</div>
                        </div>
                        <div style="height:200px" class="shiny-spinner-placeholder"></div>
                        <div class="shiny-html-output gt_shiny" id="domain_details-SDRGCOMP-gt-table"></div>
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
            </div>
          </div>
        </div>
      </bslib-layout-columns>

