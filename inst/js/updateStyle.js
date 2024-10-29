Shiny.addCustomMessageHandler('updateOpacity', function(message) {
  var el = document.getElementById(message.id);
  if (el) {
    if (typeof message.opacity !== 'undefined') {
      el.style.opacity = message.opacity;
    } else {
      console.error("Opacity value is not defined");
    }
  } else {
    console.error("Element with ID " + message.id + " not found.");
  }
});
