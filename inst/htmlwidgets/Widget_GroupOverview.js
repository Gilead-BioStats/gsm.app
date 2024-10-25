HTMLWidgets.widget({
  name: 'Widget_GroupOverview',
  type: 'output',
  factory: function(el, width, height) {
    return {
      renderValue: function(input) {
        el.id = `${input.id}`;

        // Remove any existing group overview tables to avoid duplication
        const existingTable = el.querySelector('.group-overview');
        if (existingTable) {
          el.removeChild(existingTable);
        }

        // Generate site overview table.
        const instance = rbmViz.default.groupOverview(
          el,
          input.dfResults,
          {
            GroupLevel: input.GroupLevel,
            groupLabelKey: input.strGroupLabelKey,
            groupClickCallback: function(groupData) {
              const clickedEl = event.target;
              widgetEl = findElementAncestor(clickedEl, "Widget_GroupOverview");
              widgetEl.inputData = {
                selectedGroupID: groupData.GroupID
              };
              $(widgetEl).trigger('widget-value-changed');
            },
            metricClickCallback: function(metricData) {
              const clickedEl = event.target;
              widgetEl = findElementAncestor(clickedEl, "Widget_GroupOverview");
              widgetEl.inputData = {
                selectedGroupID: metricData.GroupID,
                selectedMetricID: metricData.MetricID
              };
              $(widgetEl).trigger('widget-value-changed');
            }
          },
          input.dfGroups,
          input.dfMetrics
        );

        // Remove existing group subset dropdown if it exists, then (re)add.
        if (el.firstChild && el.firstChild.id === el.id + '-group_subset') {
          el.removeChild(el.firstChild);
        }
        addGroupSubset(el, instance, input.dfResults, input.strGroupSubset);
        // Add an id to the added div & select.
        el.firstChild.id = el.id + '-group_subset';
        const selectEl = el.firstChild.querySelector('select');
        selectEl.id = el.id + '-group_subset-select';
        selectEl.addEventListener('change', function() {
          el.inputData = {
            selectedSubset: selectEl.value
          };
          $(el).trigger('widget-value-changed');
        });

        // Apply initial group subset.
        const groupSubset = getGroupSubset(
          input.dfResults,
          input.strGroupSubset
        );

        const updatedResults = input.dfResults.filter((d) =>
          groupSubset.includes(d.GroupID)
        );

        instance.updateTable(updatedResults);
      },
      resize: function(width, height) {}
    };
  }
});
