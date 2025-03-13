document.addEventListener('DOMContentLoaded', function() {
  var navbarContainer = document.querySelector(
    '.navbar.navbar-default.navbar-static-top .container-fluid .navbar-collapse'
  );
  var customContent = document.getElementById('custom-navbar-extra');
  if (navbarContainer && customContent) {
    // Spacing breaks for this extra navbar, so we add an extra div to pad it.
    var emptyDiv = document.createElement("div");
    customContent.appendChild(emptyDiv);
    navbarContainer.appendChild(customContent);
  }
});
