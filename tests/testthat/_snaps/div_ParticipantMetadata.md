# div_ParticipantMetadata returns a default UI with empty data

    Code
      div_ParticipantMetadata(lParticipantMetadata = list())
    Output
      <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">Participant Metadata</h5>
            <hr/>
            <div class="card placeholder">
              <div class="card-body">
                <div class="card-text">Please select a participant.</div>
              </div>
            </div>
          </div>
        </div>
      </div>

# div_ParticipantMetadata returns the expected UI with data

    Code
      div_ParticipantMetadata(list(Name = "Test Person", otherField = "Field value"))
    Output
      <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">Participant Metadata</h5>
            <hr/>
            <div class="row p-2">
              <div class="col-12" style="font-weight: 500;">
                <div style="display: flex; justify-content: space-between;">
                  <div class="card-text" style="text-align: left; white-space: nowrap;">Name</div>
                  <div class="text-secondary" style="border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"></div>
                  <div class="card-text" style="text-align: right; white-space: nowrap;">Test Person</div>
                </div>
              </div>
              <div class="col-12" style="font-weight: 500;">
                <div style="display: flex; justify-content: space-between;">
                  <div class="card-text" style="text-align: left; white-space: nowrap;">otherField</div>
                  <div class="text-secondary" style="border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"></div>
                  <div class="card-text" style="text-align: right; white-space: nowrap;">Field value</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

