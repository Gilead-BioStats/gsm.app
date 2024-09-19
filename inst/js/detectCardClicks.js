const detectCardClicks = function(strContainerID, strInputID) {
  // Ensure the container exists
  var container = document.getElementById(strContainerID);
  if (!container) {
    console.error("Container with ID '" + strContainerID + "' not found.");
    return;
  }

  // Add an event listener for clicks on any card inside the container
  container.addEventListener('click', function(e) {
    var card = e.target.closest('.bslib-card');
    if (card) {
      var cardID = card.getAttribute('id');
      if (cardID) {
        updateShinyInput(strInputID, cardID);
      }
    }
  });
};
