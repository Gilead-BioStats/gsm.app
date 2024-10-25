// This is only used by detectCardClicks, and probably shouldn't be once that's
// implemented correctly.
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

const widgetPlotClickCallback = function(el) {
  return function(d) {
    const instance = el.querySelector('canvas').chart;

    // Update selectedGroupIDs and update the plot
    instance.data.config.selectedGroupIDs = instance.data.config.selectedGroupIDs.includes(d.GroupID)
      ? 'None'
      : d.GroupID;

    updateWidgetPlot(el, instance);
  };
};

const updateWidgetPlot = function(el, instance) {
  if (Object.keys(instance.helpers).includes('updateConfig')) {
    instance.helpers.updateConfig(instance, instance.data.config);
  }

  // Trigger a custom event to notify listeners
  $(el).trigger('widget-value-changed');
};

const findElementAncestor = function(el, ancestorClass) {
  let targetEl = el;
  while (targetEl && !targetEl.classList.contains(ancestorClass)) {
    targetEl = targetEl.parentElement;
  }
  return targetEl;
}
