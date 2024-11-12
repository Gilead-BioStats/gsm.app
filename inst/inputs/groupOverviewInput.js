var GroupOverviewInputBinding = new Shiny.InputBinding();

$.extend(GroupOverviewInputBinding, {
  find: function(scope) {
    return $(scope).find('.Widget_GroupOverview');
  },
  getValue: function(el) {
    return {
      selectedGroupID: el && el.inputData && el.inputData.selectedGroupID !== undefined
        ? el.inputData.selectedGroupID
        : '',
      selectedMetricID: el && el.inputData && el.inputData.selectedMetricID !== undefined
        ? el.inputData.selectedMetricID
        : '',
      groupSubset: el && el.inputData && el.inputData.selectedSubset !== undefined
        ? el.inputData.selectedSubset
        : '',
      clickCounter: el && el.inputData && el.inputData.clickCounter !== undefined
        ? el.inputData.clickCounter
        : 0
    };
  },
  subscribe: function(el, callback) {
    subscribeWidget(el, callback);
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(
  GroupOverviewInputBinding,
  "gsm.app.GroupOverviewInputBinding"
);
