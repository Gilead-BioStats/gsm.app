var ScatterPlotInputBinding  = new Shiny.InputBinding();
$.extend(ScatterPlotInputBinding , {
  find: function(scope) {
    return $(scope).find(".Widget_ScatterPlot");
  },
  getValue: function(el) {
    const canvas = el.querySelector('canvas');
    if (!canvas || !canvas.chart) {
      // Return null if the canvas or chart instance isn't ready yet
      return null;
    }
    const instance = canvas.chart;
    return instance.data.config.selectedGroupIDs;
  },
  setValue: function(el, value) {
    const instance = el.querySelector('canvas').chart;
    if (instance) {
      instance.data.config.selectedGroupIDs = value;
      if (Object.keys(instance.helpers).includes('updateConfig')) {
        instance.helpers.updateConfig(instance, instance.data.config);
      }
    }
  },
  subscribe: function(el, callback) {
    // Listen for the custom event triggered by updateWidgetPlot
    $(el).on('widgetPlot-value-changed', function() {
      callback();
    });
  },
  unsubscribe: function(el) {
    // Clean up any event listeners when the input is removed
    $(el).off('.scatterplot-input');
    el.querySelector('canvas').removeEventListener('click');
  }
});

Shiny.inputBindings.register(ScatterPlotInputBinding, "gsm.app.ScatterPlotInputBinding" );

Shiny.addCustomMessageHandler('updateWidgetPlotGroup', function(message) {
  const el = document.getElementById(message.id);
  const instance = el && el.querySelector('canvas') && el.querySelector('canvas').chart;
  if (instance) {
    instance.data.config.selectedGroupIDs = message.selectedGroupID;
    updateWidgetPlot(el, instance);
  }
});
