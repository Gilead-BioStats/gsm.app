# out_Sidebar generates the expected UI

    Code
      htmltools::as.tags(test_result$children)
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-header">
          <h5></h5>
          <h6 class="card-subtitle mb-2 text-muted mb-2">Protocol Nickname</h6>
          <h6 class="card-subtitle mb-2 text-muted">2019-11-01</h6>
        </div>
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
          <div class="metadata-list-item">
            <div class="metadata-list-item-label">Status</div>
            <div class="metadata-list-item-spacer"></div>
            <div class="metadata-list-item-value">Active</div>
          </div>
          <div class="metadata-list-item">
            <div class="metadata-list-item-label">Sites</div>
            <div class="metadata-list-item-spacer"></div>
            <div class="metadata-list-item-value">176</div>
          </div>
          <div class="metadata-list-item">
            <div class="metadata-list-item-label">Sites  Planned </div>
            <div class="metadata-list-item-spacer"></div>
            <div class="metadata-list-item-value">190</div>
          </div>
          <div class="metadata-list-item">
            <div class="metadata-list-item-label">Participants</div>
            <div class="metadata-list-item-spacer"></div>
            <div class="metadata-list-item-value">1301</div>
          </div>
          <div class="metadata-list-item">
            <div class="metadata-list-item-label">Participants  Planned </div>
            <div class="metadata-list-item-spacer"></div>
            <div class="metadata-list-item-value">1300</div>
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
      <option value="0X006">0X006</option></select>
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

