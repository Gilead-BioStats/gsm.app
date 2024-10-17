/**
 * Shiny InputBinding for a gtIO Module.
 */
var gtIOBinding = new Shiny.InputBinding();

$.extend(gtIOBinding, {
  /**
   * Finds the gtIO element within the given scope.
   *
   * @param {HTMLElement} scope - The scope in which to search for the gtIO
   *                              element.
   * @returns {jQuery} The jQuery object containing the gtIO element.
   */
  find: function(scope) {
    return $(scope).find('.gtIO');
  },
  /**
   * Gets the value of the selected select ID from the gtIO element.
   *
   * @param {HTMLElement} el - The element containing the gtIO.
   * @returns {string|null} The selected select ID, or null if no select is
   *                        selected.
   */
  getValue: function(el) {
    return $(el).data('selectID');
  },
  /**
   * Sets the selected select ID for the gtIO element.
   *
   * @param {HTMLElement} el    - The element containing the gtIO.
   * @param {string}      value - The new selected select ID.
   */
  setValue: function(el, value) {
    $(el).data('selectID', value);
  },
  /**
   * Update Shiny when a gtIO element changes.
   *
   * @param {HTMLElement} el       - The element containing the gtIO.
   * @param {function}    callback - The callback to trigger when the gtIO
   *                                 element changes.
   */
  subscribe: function(el, callback) {
    $(el).on('gtIO-value-changed', function(event) {
      callback();
    });
  },
  /**
   * Unsubscribes from custom events for the gtIO element.
   *
   * @param {HTMLElement} el - The element containing the gtIO.
   */
  unsubscribe: function(el) {
    $(el).off('gtIO-value-changed');
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(gtIOBinding, 'gsm.app.gtIOBinding');
