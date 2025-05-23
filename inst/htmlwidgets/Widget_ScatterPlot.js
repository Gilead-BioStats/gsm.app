/**
 * Factory function for creating the Widget_ScatterPlot HTML widget.
 *
 * @param {HTMLElement} el     - The HTML element to attach the widget to.
 * @param {number}      width  - The width of the widget.
 * @param {number}      height - The height of the widget.
 * @returns {Object} An object containing the renderValue and resize functions
 *                   for the widget.
 */
HTMLWidgets.widget({
  name: 'Widget_ScatterPlot',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        el.id = `${input.id}`;
        input.lMetric.clickCallback = widgetPlotClickFactory(el);

        // Generate scatter plot.
        const instance = gsmViz.default.scatterPlot(
          el,
          input.dfResults,
          input.lMetric,
          input.dfBounds,
          input.dfGroups
        );

        // Add a footnote below the scatter plot.
        addFootnote(el, input.strFootnote);
      },
      resize: noSpecialResizing // See widgetHelpers.js
    };
  }
});
