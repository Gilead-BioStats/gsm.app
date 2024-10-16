Shiny.addCustomMessageHandler("bindGTClick", function(message) {
  console.log("Binding GT click");

  var table = document.getElementById(message.ns);

  if (table) {
    var observer = new MutationObserver(function(mutations) {
      // Check if rows are added to the table
      var rows = table.querySelectorAll(".rt-tbody .rt-tr");
      if (rows.length > 0) {
        console.log("Rows found, binding event listeners.");
        rows.forEach(function(row, index) {
          row.addEventListener('click', function(event) {
            console.log("Row " + index + " clicked");
            var customEvent = new CustomEvent('gtTable-row-clicked', {
              detail: { index: index }
            });
            table.dispatchEvent(customEvent);
          });
        });
        Shiny.initializeInputs();
        Shiny.bindAll();
        observer.disconnect();
      }
    });
    observer.observe(table, {
      childList: true,
      subtree: true
    });
  }
});

Shiny.addCustomMessageHandler("selectRow", function(message) {
  const table = document.getElementById(message.ns);
  if (table) {
    const rows = table.getElementsByTagName("tr");
    if (message.row >= 0 && message.row < rows.length) {
      rows[message.row].classList.add("highlighted");
    }
  }
});
