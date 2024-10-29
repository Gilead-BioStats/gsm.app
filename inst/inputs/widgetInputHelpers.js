/**
 * Finds a widget within the given scope using the provided class name.
 *
 * @param {HTMLElement} scope  - The scope in which to search for the widget.
 * @param {string} widgetName  - The name of the widget. such as
 *                               "Widget_ScatterPlot".
 * @returns {jQuery} The jQuery object containing the plot widget.
 */
function findWidget(scope, widgetName) {
  return $(scope).find('.' + widgetName);
}

/**
 * Gets the value of the selected group IDs from the plot widget.
 *
 * @param {HTMLElement} el - The element containing the plot.
 * @returns {Array|null} The selected group IDs, or null if the chart is not
 *                       ready.
 */
function getWidgetPlotValue(el) {
  const canvas = el.querySelector('canvas');
  if (!canvas || !canvas.chart) {
    return null;
  }
  return canvas.chart.data.config.selectedGroupIDs;
}

/**
 * Sets the selected group IDs for the plot widget.
 *
 * @param {HTMLElement} el    - The element containing the plot.
 * @param {Array}       value - The new selected group IDs.
 */
function setWidgetPlotValue(el, value) {
  const instance = el.querySelector('canvas').chart;
  if (instance) {
    instance.data.config.selectedGroupIDs = value;
    if (Object.keys(instance.helpers).includes('updateConfig')) {
      instance.helpers.updateConfig(instance, instance.data.config);
    }
  }
}

/**
 * Subscribes to widget changes.
 *
 * @param {HTMLElement} el       - The element containing the widget.
 * @param {function}    callback - The callback to trigger when the widget
 *                                 changes.
 */
function subscribeWidget(el, callback) {
  $(el).on('widget-value-changed', function() {
    callback();
  });
}

/**
 * Unsubscribes from plot widget changes.
 *
 * @param {HTMLElement} el   - The element containing the plot.
 * @param {string} namespace - The event namespace for the specific plot type.
 */
function unsubscribeWidgetPlot(el, namespace) {
  $(el).off(namespace);
  el.querySelector('canvas').removeEventListener('click');
}

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
