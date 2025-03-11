HTMLWidgets.widget({
  name: 'Widget_BarChart',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        el.id = `${input.id}`;
        input.lMetric.clickCallback = widgetPlotClickFactory(el);

        // Generate bar chart.
        const instance = gsmViz.default.barChart(
          el,
          input.dfResults,
          // specify outcome to be plotted on the y-axis
          {...input.lMetric, y: input.strOutcome},
          input.vThreshold,
          input.dfGroups
        );
      },
      resize: noSpecialResizing // See widgetHelpers.js
    };
  }
});
