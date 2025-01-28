HTMLWidgets.widget({
  name: 'Widget_TimeSeries',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        el.id = `${input.id}`;
        input.lMetric.clickCallback = widgetPlotClickFactory(el);

        // Generate time series.
        const instance = rbmViz.default.timeSeries(
          el,
          input.dfResults,
          // specify outcome to be plotted on the y-axis
          {...input.lMetric, y: input.strOutcome},
          input.vThreshold,
          null, // confidence intervals parameter
          input.dfGroups
        );


        // Add a footnote below the plot.
        addFootnote(el, input.strFootnote);
      },
      resize: noSpecialResizing // See widgetHelpers.js
    };
  }
});
