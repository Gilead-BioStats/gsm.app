/**
 * Shiny InputBinding for a Metric Table.
 */
var gtTableBinding = new Shiny.InputBinding();

$.extend(gtTableBinding, {
  find: function(scope) {
    var element = $(scope).find('.gtInput'); // Adjust this selector if necessary
    console.log("Found element for gtTableBinding:", element);
    return element;
  },
  getValue: function(el) {
    return $(el).data('selectedRow');
  },
  setValue: function(el, value) {
    $(el).data('selectedRow', value);
  },
  subscribe: function(el, callback) {
    $(el).on('gtTable-row-clicked', function(event) {
      var rowIndex = event.originalEvent.detail.index; // Get the clicked row index
      console.log("Custom event received for row: " + rowIndex); // Log the row click

      // Update the selectedRow using setValue
      gtTableBinding.setValue(el, rowIndex + 1); // Use 1-based indexing for Shiny

      // Trigger the change event to notify Shiny
      $(el).trigger('change');

      // Call the callback to notify Shiny that the input has changed
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off('gtTable-row-clicked');
  }
});

// Register the input binding with Shiny
Shiny.inputBindings.register(gtTableBinding, 'gsm.app.gtTableBinding');
