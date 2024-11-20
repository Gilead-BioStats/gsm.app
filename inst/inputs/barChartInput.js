/**
 * Shiny InputBinding for a bar chart widget.
 */
var BarChartInputBinding = new Shiny.InputBinding();

$.extend(BarChartInputBinding, {
  /**
   * Finds the bar chart widget within the given scope.
   *
   * @param {HTMLElement} scope - The scope in which to search for the plot
   *                              widget.
   * @returns {jQuery} The jQuery object containing the plot widget.
   */
  find: function(scope) {
    return $(scope).find('.Widget_BarChart');
  },

  /**
   * Gets the value of the selected group IDs from the plot widget.
   *
   * @param {HTMLElement} el - The element containing the plot.
   * @returns {Array|null} The selected group IDs, or null if the chart is not
   *                       ready.
   */
  getValue: function(el) {
    return getWidgetPlotValue(el);
  },

  /**
   * Sets the selected group IDs for the plot widget.
   *
   * @param {HTMLElement} el    - The element containing the plot.
   * @param {Array}       value - The new selected group IDs.
   */
  setValue: function(el, value) {
    setWidgetPlotValue(el, value);
  },

  /**
   * Update Shiny when a plot widget changes.
   *
   * @param {HTMLElement} el       - The element containing the plot.
   * @param {function}    callback - The callback to trigger when the plot
   *                                 changes.
   */
  subscribe: function(el, callback) {
    subscribeWidget(el, callback);
  },

  /**
   * Unsubscribes from custom events for the bar chart widget.
   *
   * @param {HTMLElement} el - The element containing the plot.
   */
  unsubscribe: function(el) {
    unsubscribeWidgetPlot(el, '.barchart-input');
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(
  BarChartInputBinding,
  "gsm.app.BarChartInputBinding"
);
