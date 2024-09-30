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

const chartClickCallback = function(el, inputID) {
  return function(d) {
    const instance = el.querySelector('canvas').chart;

    // Update selectedGroupIDs and update the plot
    instance.data.config.selectedGroupIDs = instance.data.config.selectedGroupIDs.includes(d.GroupID)
      ? 'None'
      : d.GroupID;

    if (Object.keys(instance.helpers).includes('updateConfig')) {
      instance.helpers.updateConfig(instance, instance.data.config);
    }

    // Check if selectedGroupIDs is empty or 'None', and send 'None' if true
    const selectedIDs = (Array.isArray(instance.data.config.selectedGroupIDs) &&
    instance.data.config.selectedGroupIDs.length === 0)
      ? 'None'
      : instance.data.config.selectedGroupIDs;

    // Call the Shiny updater
    updateShinyInput(inputID, selectedIDs);
  };
};
