/**
 * Update the selected selectID when a row is clicked.
 *
 * @param {HTMLElement} row   - The table row that was clicked.
 * @param {HTMLElement} table - The table element containing the row.
 */
const gtRowClickCallback = function(row, table) {
  var selectID = extractSelectID(row);
  if (selectID) {
    var currentSelectID = $(table).data('selectID');
    if (currentSelectID === selectID) {
      selectID = "None";
    }
    $(table).data('selectID', selectID);
    table.setAttribute('data-selectid', selectID);
    $(table).trigger('gtIO-value-changed');
  }
};

/**
 * Bind click events to table rows and set up observers for selectID changes and
 * table state changes.
 *
 * @param {HTMLElement} table - The table element containing the rows.
 * @returns {boolean} True if rows were found and bound, false otherwise.
 */
const gtBindRowClickEvents = function(table) {
  var rows = table.querySelectorAll(".rt-tbody .rt-tr");
  if (rows.length > 0) {
    rows.forEach(function(row) {
      row.addEventListener('click', function() {
        gtRowClickCallback(row, table);
      });
    });

    const observer = new MutationObserver(function() {
      gtUpdateRowHighlight(table);
    });
    observer.observe(table, { attributes: true, attributeFilter: ['data-selectid'] });

    reactable_table = table.querySelector(".reactable");
    window.Reactable.onStateChange(reactable_table.id, function(state) {
      gtUpdateRowHighlight(table);
    });

    return true;
  }
  return false;
};

/**
 * Mutation observer callback to bind row click events and stop observing once
 * rows are bound.
 *
 * @param {HTMLElement}      table    - The table element containing the rows.
 * @param {MutationObserver} observer - The mutation observer instance to
 *                                      disconnect.
 */
const gtMutationCallback = function(table, observer) {
  if (gtBindRowClickEvents(table)) {
    observer.disconnect(); // Stop observing once rows are found and bound
  }
};

/**
 * Update the row highlights based on the selected selectID.
 *
 * @param {HTMLElement} table - The table element containing the rows.
 */
const gtUpdateRowHighlight = function(table) {
  var rows = table.querySelectorAll('.rt-tbody .rt-tr');
  var selectedSelectID = $(table).data('selectID');
  rows.forEach(function(row) {
    var selectID = extractSelectID(row);
    if (selectID) {
      if (selectID === selectedSelectID) {
        row.classList.add('rt-tr-selected');
      } else {
        row.classList.remove('rt-tr-selected');
      }
    }
  });
};

/**
 * Custom Shiny message handler to bind row click events and observe changes in
 * the table.
 *
 * @param {Object} message    - The message object containing the table ID.
 * @param {string} message.id - The ID of the table to bind events and observe
 *                              changes.
 */
Shiny.addCustomMessageHandler("gtBindClick", function(message) {
  var table = document.getElementById(message.id);
  if (table) {
    var observer = new MutationObserver(function() {
      gtMutationCallback(table, observer);
    });
    observer.observe(table, {
      childList: true,
      subtree: true
    });
  }
});

/**
 * Custom Shiny message handler to set the selectID for a table if it has
 * changed.
 *
 * @param {Object} message         - The message object containing the table ID
 *                                   and selectID.
 * @param {string} message.id      - The ID of the table to set the selectID for.
 * @param {string} message.selectID - The new selectID to set.
 */
Shiny.addCustomMessageHandler("gtSetSelectID", function(message) {
  var table = document.getElementById(message.id);
  if (table) {
    var currentSelectID = $(table).data('selectID');
    if (currentSelectID !== message.selectID) {
      $(table).data('selectID', message.selectID);
      table.setAttribute('data-selectid', message.selectID);
      $(table).trigger('gtIO-value-changed');
    }
  }
});

/**
 * Extract the selectID from the first cell of a table row. This should
 * eventually be rethough for generalizability.
 *
 * @param {HTMLElement} row - The table row to extract the selectID from.
 * @returns {string|null} The extracted selectID, or null if no valid cell is
 *                        found.
 */
const extractSelectID = function(row) {
  var firstCell = row.querySelector('.rt-td .rt-text-content');
  if (firstCell) {
    var cellText = firstCell.textContent.trim();
    return cellText.replace(/\s*\(.*?\)$/, '');
  }
  return null;
};
