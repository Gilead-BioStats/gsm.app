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
function isCanvasLoaded(containerId) {
  const canvas = document.querySelector(`#${containerId} canvas`);
  if (!canvas) return false;
  if (canvas.width === 0 || canvas.height === 0) return false;

  const context = canvas.getContext('2d');
  if (!context) return false;

  // Check if the canvas is visible (i.e., has a non-zero bounding box)
  const boundingRect = canvas.getBoundingClientRect();
  if (boundingRect.width === 0 || boundingRect.height === 0) return false;
  if (boundingRect.top < 0 || boundingRect.left < 0 || boundingRect.bottom > window.innerHeight || boundingRect.right > window.innerWidth) return false;

  // Check pixel contents.
  const isNonEmptyPixel = (x, y) => {
    const [r, g, b, a] = context.getImageData(x, y, 1, 1).data;
    return r !== 0 || g !== 0 || b !== 0 || a !== 0;
  };
  if (!isNonEmptyPixel(0, 0)) return false; // Top-left
  if (!isNonEmptyPixel(canvas.width / 2, canvas.height / 2)) return false; // Center
  if (!isNonEmptyPixel(canvas.width - 1, canvas.height - 1)) return false; // Bottom-right

  return true; // Canvas is fully loaded
}

