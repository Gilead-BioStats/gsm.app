# mod_ParticipantDomain_Server sets title and placeholder when no data is available

    Code
      output$details$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a participant and a domain.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

# mod_ParticipantDomain_Server sets title and placeholder when data is available but no table name is selected

    Code
      output$details$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a domain.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

