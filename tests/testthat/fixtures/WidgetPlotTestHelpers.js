/**
 * Simulates a mouse click event (mousedown, mouseup, and click) at the
 * specified coordinates on the given element.
 *
 * @param {HTMLElement} el - The target element to dispatch the mouse events on.
 * @param {number}      x  - The x-coordinate (clientX) relative to the viewport
 *                           where the click should occur.
 * @param {number}      y  - The y-coordinate (clientY) relative to the viewport
 *                           where the click should occur.
 *
 * @returns {undefined}
 */
function clickWithMouse(el, x, y) {
  if (!el) {
    console.error("Element not found");
    return;
  }

  var clickLocation = { clientX: x, clientY: y };

  var mousedownEvent = new MouseEvent('mousedown', clickLocation);
  el.dispatchEvent(mousedownEvent);

  var mouseupEvent = new MouseEvent('mouseup', clickLocation);
  el.dispatchEvent(mouseupEvent);

  var clickEvent = new MouseEvent('click', clickLocation);
  el.dispatchEvent(clickEvent);
}

/**
 * Simulates a click on a specific gruop in a chart widget, identified by its
 * container ID and target group ID.
 *
 * @param {string} containerId    - The ID of the container element that holds
 *                                  the chart.
 * @param {string} targetGroupID  - The group ID of the data point to click on.
 *
 * @returns {undefined}
 */
function clickWidgetPlotGroup(containerId, targetGroupID) {
  var canvas = document.querySelector(`#${containerId} canvas`);
  if (!canvas || !canvas.chart) {
    console.error("Canvas or chart instance not found for:", containerId);
    return;
  }

  var instance = canvas.chart;
  var data = instance.data.datasets[0].data;
  var xScale = instance.scales.x;
  var yScale = instance.scales.y;

  data.forEach(function(point) {
    if (point.GroupID === targetGroupID) {
      // Get the pixel coordinates for the point
      var xpix = xScale.getPixelForValue(point.x);
      var ypix = yScale.getPixelForValue(point.y);

      // Calculate the clientX and clientY relative to the viewport
      var rect = canvas.getBoundingClientRect();
      var clientX = rect.left + xpix;
      var clientY = rect.top + ypix;

      // Use the abstracted function to simulate the click
      clickWithMouse(canvas, clientX, clientY);
    }
  });
}

/**
 * Checks if a chart widget has finished loading by validating the presence of
 * a chart and checking certain chart properties.
 *
 * @param {string} containerId - The ID of the container element that holds the
 *                               chart.
 *
 * @returns {boolean} True if the widget is fully loaded, false otherwise.
 */
function isWidgetPlotLoaded(containerId) {
  var canvas = document.querySelector(`#${containerId} canvas`);
  if (!canvas) return false;

  var context = canvas.getContext('2d');
  if (!context) return false;

  var pixelData = context.getImageData(0, 0, 1, 1).data;
  return pixelData.some(channel => channel !== 0); // Canvas has content drawn
}
