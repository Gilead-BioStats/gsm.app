/**
 * Gets the value of the selected group IDs from the plot widget.
 *
 * @param {HTMLElement} el - The element containing the plot.
 * @returns {Array|null} The selected group IDs, or null if the chart is not
 *                       ready.
 */
const getWidgetPlotValue = function(el) {
  const canvas = el.querySelector('canvas');
  if (!canvas || !canvas.chart) {
    return null; // Not yet initialized
  }
  const selectedGroupIDs = canvas.chart.data.config.selectedGroupIDs;
  if (Array.isArray(selectedGroupIDs) && selectedGroupIDs.length === 0) {
    return ['None']; // Explicit empty selection
  }
  return selectedGroupIDs;
};

/**
 * Sets the selected group IDs for the plot widget.
 *
 * @param {HTMLElement} el    - The element containing the plot.
 * @param {Array}       value - The new selected group IDs.
 */
const setWidgetPlotValue = function(el, value) {
  const instance = el.querySelector('canvas').chart;
  if (instance) {
    instance.data.config.selectedGroupIDs = value;
    if (Object.keys(instance.helpers).includes('updateConfig')) {
      instance.helpers.updateConfig(instance, instance.data.config);
    }
  }
};

/**
 * Subscribes to widget changes.
 *
 * @param {HTMLElement} el       - The element containing the widget.
 * @param {function}    callback - The callback to trigger when the widget
 *                                 changes.
 */
const subscribeWidget = function(el, callback) {
  $(el).on('widget-value-changed', function() {
    callback();
  });
};

/**
 * Unsubscribes from plot widget changes.
 *
 * @param {HTMLElement} el        - The element containing the plot.
 * @param {string}      namespace - The event namespace for the specific plot
 *                                  type.
 */
const unsubscribeWidgetPlot = function(el, namespace) {
  $(el).off(namespace);
  el.querySelector('canvas').removeEventListener('click');
};

/**
 * Custom message handler for updating plot widgets.
 *
 * @param {Object} message                 - The message object containing the
 *                                           update details.
 * @param {string} message.id              - The ID of the widget to update.
 * @param {Array}  message.selectedGroupID - The new selected group IDs.
 */
Shiny.addCustomMessageHandler('updateWidgetPlotGroup', function(message) {
  const el = document.getElementById(message.id);
  const instance = el && el.querySelector('canvas') &&
                   el.querySelector('canvas').chart;
  if (instance) {
    instance.data.config.selectedGroupIDs = message.selectedGroupID;
    updateWidgetPlot(el, instance);
  }
});
