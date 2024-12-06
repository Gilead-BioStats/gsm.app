# mod_ParticipantDomainSummary_Server renders correctly without data

    Code
      output$domain_list$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a participant.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

# mod_ParticipantDomainSummary_Server renders correctly with data

    Code
      output$domain_list$html
    Output
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="proxy1-domain_list_choices-domain1" href="#" class="action-button">domain1</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">5</div>
      </div>
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="proxy1-domain_list_choices-domain2" href="#" class="action-button">domain2</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">5</div>
      </div>

