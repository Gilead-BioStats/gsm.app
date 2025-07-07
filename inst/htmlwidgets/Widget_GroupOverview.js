/**
 * Factory function for creating the Widget_GroupOverview HTML widget.
 *
 * @param {HTMLElement} el     - The HTML element to attach the widget to.
 * @param {number}      width  - The width of the widget.
 * @param {number}      height - The height of the widget.
 * @returns {Object} An object containing the renderValue and resize functions
 *                   for the widget.
 */
HTMLWidgets.widget({
  name: 'Widget_GroupOverview',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        el.id = `${input.id}`;

        // Remove any existing group overview tables to avoid duplication
        removeChildElements(el, '.group-overview');

        // Generate group overview table.
        let clickCounter = 0;
        const incrementer = () => ++clickCounter;
        const instance = gsmViz.default.groupOverview(
          el,
          input.dfResults,
          {
            GroupLevel: input.strGroupLevel,
            groupLabelKey: input.strGroupLabelKey,
            groupClickCallback: groupOverviewGroupClickFactory(incrementer),
            metricClickCallback: groupOverviewMetricClickFactory(incrementer)
          },
          input.dfGroups,
          input.dfMetrics
        );

        // Add and apply group subset menu.
        removeChildElements(el, `#${el.id}-group_subset`);
        addGroupSubset(el, instance, input.dfResults, input.strGroupSubset);
        finalizeGroupSubsetDropdown(el, instance);
        applyGroupSubset(instance, input.dfResults, input.strGroupSubset);
      },
      resize: noSpecialResizing // See widgetHelpers.js
    };
  }
});

/**
 * Creates a click callback function for group overview tables.
 *
 * @param {Function} incrementClickCounter - Function to increment the click
 *                                           counter.
 * @returns {Function} A callback function for handling group clicks.
 */
const groupOverviewGroupClickFactory = function(incrementClickCounter) {
  return function(groupData) {
    const clickCount = incrementClickCounter();
    const clickedEl = event.target;
    const widgetEl = findElementAncestor(clickedEl, "Widget_GroupOverview");
    widgetEl.inputData = {
      selectedGroupID: groupData.GroupID,
      clickCounter: clickCount
    };
    $(widgetEl).trigger('widget-value-changed');
  };
};

/**
 * Creates a click callback function for metric overview tables.
 *
 * @param {Function} incrementClickCounter - Function to increment the click
 *                                           counter.
 * @returns {Function} A callback function for handling metric clicks.
 */
const groupOverviewMetricClickFactory = function(incrementClickCounter) {
  return function(metricData) {
    const clickCount = incrementClickCounter();
    const clickedEl = event.target;
    const widgetEl = findElementAncestor(clickedEl, "Widget_GroupOverview");
    widgetEl.inputData = {
      selectedGroupID: metricData.GroupID,
      selectedMetricID: metricData.MetricID,
      clickCounter: clickCount
    };
    $(widgetEl).trigger('widget-value-changed');
  };
};

/**
 * Finalizes the group subset dropdown by assigning IDs and adding event
 * listeners.
 *
 * @param {HTMLElement} el  - The HTML element containing the widget.
 * @param {Object} instance - The widget instance.
 */
const finalizeGroupSubsetDropdown = function(el, instance) {
  // Assign ID to the newly added div & select
  el.firstChild.id = `${el.id}-group_subset`;
  const selectEl = el.firstChild.querySelector('select');
  selectEl.id = `${el.id}-group_subset-select`;

  // Add event listener for changes in dropdown selection
  selectEl.addEventListener('change', function() {
    el.inputData = {
      selectedSubset: selectEl.value
    };
    $(el).trigger('widget-value-changed');
  });
};

/**
 * Applies the group subset filter to the widget instance.
 *
 * @param {Object} instance       - The widget instance.
 * @param {Array} dfResults       - The data frame containing results.
 * @param {string} strGroupSubset - The group subset to apply.
 */
const applyGroupSubset = function(instance, dfResults, strGroupSubset) {
  const groupSubset = getGroupSubset(dfResults, strGroupSubset);
  const updatedResults = dfResults.filter((d) =>
    groupSubset.includes(d.GroupID)
  );

  instance.updateTable(updatedResults);
};
