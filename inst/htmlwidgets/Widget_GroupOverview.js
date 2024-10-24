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
            groupLabelKey: input.strGroupLabelKey
          },
          input.dfGroups,
          input.dfMetrics
        );

        // Remove existing group subset dropdown if it exists, then (re)add.
        if (el.firstChild && el.firstChild.tagName === 'DIV' && el.firstChild.querySelector('select')) {
          el.removeChild(el.firstChild);
        }
        addGroupSubset(el, instance, input.dfResults, input.strGroupSubset);

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
