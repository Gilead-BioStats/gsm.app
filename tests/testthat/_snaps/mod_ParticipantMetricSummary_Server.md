# mod_ParticipantMetricSummary_Server renders correctly without data

    Code
      output$metric_list$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a participant.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

# mod_ParticipantMetricSummary_Server renders correctly with data

    Code
      output$metric_list$html
    Output
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="proxy1-metric_list_choices-metric1" href="#" class="action-button">Metric1</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">5</div>
      </div>
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="proxy1-metric_list_choices-metric2" href="#" class="action-button">Metric2</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">5</div>
      </div>

