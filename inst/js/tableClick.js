/**
 * Listens for clicks on a table and highlights the site selector
 *
 * @param {HTMLElement} tableId - The unique element id for the table's parent div for the script to listen
 * @returns {undefined}
 */

 const tableClick = function (tableId) {

  document.getElementById(tableId).addEventListener('click', function(event) {
    var target = event.target;
    while (target && target.tagName !== 'TR') {
      target = target.parentElement;
    }

    if (target && target.tagName === 'TR') {
      var firstColumnValue = target.querySelector('td:first-child').textContent.trim().replace(/ \(.*\)$/, '');

      Shiny.setInputValue('site', firstColumnValue, { priority: 'event' });
    }
  });

 }
