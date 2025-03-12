document.addEventListener('DOMContentLoaded', function() {
  var navbarContainer = document.querySelector('.navbar.navbar-default.navbar-static-top .container-fluid');
  var customContent = document.getElementById('custom-navbar-right');
  if (navbarContainer && customContent) {
    navbarContainer.appendChild(customContent);
  }
});
