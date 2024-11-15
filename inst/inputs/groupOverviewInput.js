/**
 * Shiny InputBinding for a group overview widget.
 */
var GroupOverviewInputBinding = new Shiny.InputBinding();

$.extend(GroupOverviewInputBinding, {
  /**
   * Finds the group overview widget within the given scope.
   *
   * @param {HTMLElement} scope - The scope in which to search for the group
   *                              overview widget.
   * @returns {jQuery} The jQuery object containing the group overview widget.
   */
  find: function(scope) {
    return $(scope).find('.Widget_GroupOverview');
  },

  /**
   * Gets the value of the selected group, metric, subset, and click counter
   * from the group overview widget.
   *
   * @param {HTMLElement} el - The element containing the group overview widget.
   * @returns {Object} An object containing the selected group ID, selected
   *                   metric ID, group subset, and click counter.
   */
  getValue: function(el) {
    return {
      selectedGroupID: el && el.inputData && el.inputData.selectedGroupID !== undefined
        ? el.inputData.selectedGroupID
        : '',
      selectedMetricID: el && el.inputData && el.inputData.selectedMetricID !== undefined
        ? el.inputData.selectedMetricID
        : '',
      groupSubset: el && el.inputData && el.inputData.selectedSubset !== undefined
        ? el.inputData.selectedSubset
        : '',
      clickCounter: el && el.inputData && el.inputData.clickCounter !== undefined
        ? el.inputData.clickCounter
        : 0
    };
  },

  /**
   * Update Shiny when the group overview widget changes.
   *
   * @param {HTMLElement} el       - The element containing the group overview
   *                                 widget.
   * @param {function}    callback - The callback to trigger when the group
   *                                 overview changes.
   */
  subscribe: function(el, callback) {
    subscribeWidget(el, callback);
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(
  GroupOverviewInputBinding,
  "gsm.app.GroupOverviewInputBinding"
);
