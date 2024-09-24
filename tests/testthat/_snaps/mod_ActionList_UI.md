# mod_ActionList_UI creates the expected UI

    Code
      mod_ActionList_UI("listID", chrLinkIDs = state.abb[1:3], chrLabels = state.name[
        1:3], chrValues = 1:3)
    Output
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="listID-AL" href="#" class="action-button">Alabama</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">1</div>
      </div>
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="listID-AK" href="#" class="action-button">Alaska</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">2</div>
      </div>
      <div class="metadata-list-item">
        <div class="metadata-list-item-label">
          <a id="listID-AZ" href="#" class="action-button">Arizona</a>
        </div>
        <div class="metadata-list-item-spacer"></div>
        <div class="metadata-list-item-value">3</div>
      </div>

