/**
 * Updates the value of a Shiny input if it has changed. This is only used by
 * detectCardClicks, and probably shouldn't be once that's implemented
 * correctly.
 *
 * @param {string} inputID  - The ID of the Shiny input to update.
 * @param {*}      newValue - The new value to set for the input.
 */
const updateShinyInput = function(inputID, newValue) {
  if (
    typeof Shiny !== 'undefined' &&
    typeof newValue !== 'undefined' &&
    typeof inputID !== 'undefined' &&
    inputID.trim() !== ''
  ) {
    const currentShinyValue = Shiny.shinyapp.$inputValues[inputID];

    if (currentShinyValue === undefined || newValue !== currentShinyValue) {
      Shiny.setInputValue(inputID, newValue);
    }
  }
};

/**
 * Creates a click callback function for handling plot clicks in a widget.
 *
 * @param {HTMLElement} el - The HTML element containing the widget.
 * @returns {Function} A callback function to handle plot click events.
 */
const widgetPlotClickFactory = function(el) {
  return function(d) {
    const instance = el.querySelector('canvas').chart;

    // Update selectedGroupIDs and update the plot
    instance.data.config.selectedGroupIDs = instance.data.config.selectedGroupIDs.includes(d.GroupID)
      ? []
      : d.GroupID;

    updateWidgetPlot(el, instance);
  };
};

/**
 * Updates the plot in the widget and triggers a custom event to notify
 * listeners.
 *
 * @param {HTMLElement} el       - The HTML element containing the widget.
 * @param {Object}      instance - The instance of the chart to update.
 */
const updateWidgetPlot = function(el, instance) {
  if (Object.keys(instance.helpers).includes('updateConfig')) {
    instance.helpers.updateConfig(instance, instance.data.config);
  }

  // Trigger a custom event to notify listeners
  $(el).trigger('widget-value-changed');
};

/**
 * Finds the ancestor element of a given element that matches a specified class.
 *
 * @param {HTMLElement} el            - The element to start searching from.
 * @param {string}      ancestorClass - The class name of the ancestor to find.
 * @returns {HTMLElement|null} The ancestor element if found, otherwise null.
 */
const findElementAncestor = function(el, ancestorClass) {
  let targetEl = el;
  while (targetEl && !targetEl.classList.contains(ancestorClass)) {
    targetEl = targetEl.parentElement;
  }
  return targetEl;
};

/**
 * Placeholder to use as a resizer when no special resizing logic is required.
 *
 * @param {number} width  - The new width of the widget.
 * @param {number} height - The new height of the widget.
 */
const noSpecialResizing = function(width, height) {
  // No special resizing required.
  return;
};

/**
 * Removes child elements from a given element based on a selector.
 *
 * @param {HTMLElement} el       - The parent element from which to remove
 *                                 children.
 * @param {string}      selector - The selector to identify which child elements
 *                                 to remove.
 */
const removeChildElements = function(el, selector) {
  const elements = el.querySelectorAll(selector);
  elements.forEach((element) => el.removeChild(element));
};
