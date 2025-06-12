/**
 * Hides all bslib-grid-item ancestors of div.chart elements that have a
 * data-group-level attribute different from the specified groupLevel.
 * This allows selectively showing charts matching a particular group level
 * while hiding others.
 *
 * @param {object} message            - An object containing the selected group
 *                                      level.
 * @param {string} message.groupLevel - The group level to keep visible.
 */
Shiny.addCustomMessageHandler('hideOtherGroupLevels', function(message) {
  if (!message.groupLevel) {
    console.error("Missing 'groupLevel' in message to hideOtherGroupLevels.");
    return;
  }

  document.querySelectorAll('div.chart[data-group-level]')
    .forEach(chart => {
      const level = chart.getAttribute('data-group-level');
      const gridItem = chart.closest('div.bslib-grid-item');
      if (!gridItem) return;

      if (level === message.groupLevel) {
        gridItem.hidden = false;
        Shiny.bindAll(gridItem);
      } else {
        gridItem.hidden = true;
      }
    });
});
