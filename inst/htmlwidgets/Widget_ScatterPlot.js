HTMLWidgets.widget({
  name: 'Widget_ScatterPlot',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        // Assign a unique ID to the element.
        el.id = `${input.id}`;

        // Add click event callback to chart.
        const inputID = input.strInputID;
        input.lMetric.clickCallback = chartClickCallback(el, inputID);

        // Generate scatter plot.
        const instance = rbmViz.default.scatterPlot(
          el,
          input.dfResults,
          input.lMetric,
          input.dfBounds,
          input.dfGroups
        );

        // Add a footnote below the scatter plot.
        const footnoteId = `${el.id}-footnote`;
        let footnote = document.getElementById(footnoteId);
        if (!footnote) {
          footnote = document.createElement('div');
          footnote.id = footnoteId;
          footnote.style.fontSize = '10px';
          footnote.style.color = '#555';
          footnote.innerHTML = input.strFootnote;
          el.appendChild(footnote);
        }

        // Update the Shiny input with the plot's current state
        updateShinyInput(inputID, instance.data.config.selectedGroupIDs);
      },
      resize: function(width, height) {}
    };
  }
});
