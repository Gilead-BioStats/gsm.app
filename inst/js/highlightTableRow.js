/**
 * Monitors the reactive site variable selected by the user and highlights a table accordingly
 *
 * @param {HTMLElement} tableId - The unique element id for the table's parent div to apply the changes
 * @param {String} site - The site ID that matches to a row to highlight
 *
 * @returns {undefined}
 */

 const highlightTableRow = function (tableId, site) {


      if (site === "None") {

          var tableAll = document.getElementById(tableId).querySelectorAll('table');
          tableAll.forEach(function(x) {
            x.classList.add('table-striped');
          });


          var highlightRow = document.getElementById(tableId).querySelectorAll('table tbody tr');
          highlightRow.forEach(function(row) {
                  row.classList.remove('table-deemphasize');
                  row.classList.remove('table-primary');

          })

      } else {

          var tableAll = document.getElementById(tableId).querySelectorAll('table');
          tableAll.forEach(function(x) {
            x.classList.remove('table-striped');
          });

          var highlightRow = document.getElementById(tableId).querySelectorAll('table tbody tr');

          highlightRow.forEach(function(row) {
              var groupCell = row.querySelector('td:first-child')
              var cellText = groupCell.textContent.trim().replace(/ \(.*\)$/, '');
              if (cellText === site) {
                row.classList.add('table-primary');
                row.classList.remove('table-deemphasize');
              } else {
                row.classList.add('table-deemphasize');
                row.classList.remove('table-primary');
              }

          });
      }

 }
