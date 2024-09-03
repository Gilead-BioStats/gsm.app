# out_ParticipantMetadata returns a default UI with empty data

    Code
      out_ParticipantMetadata(lParticipantMetadata = list())
    Output
      <div class="container-fluid">
        <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <h5>Participant Metadata</h5>
            <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
              <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a participant.</div>
              <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
            </div>
          </div>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

# out_ParticipantMetadata returns the expected UI with data

    Code
      out_ParticipantMetadata(list(Name = "Test Person", otherField = "Field value"))
    Output
      <div class="container-fluid">
        <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
          <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
            <h5>Participant Metadata</h5>
            <div class="metadata-list-item">
              <div class="metadata-list-item-label">Name</div>
              <div class="metadata-list-item-spacer"></div>
              <div class="metadata-list-item-value">Test Person</div>
            </div>
            <div class="metadata-list-item">
              <div class="metadata-list-item-label">Other Field</div>
              <div class="metadata-list-item-spacer"></div>
              <div class="metadata-list-item-value">Field value</div>
            </div>
          </div>
          <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
        </div>
      </div>

