/**
 * Simulates a mouse click event (mousedown, mouseup, and click) at the
 * specified coordinates relative to the top-left corner of the target element,
 * ensuring the event bubbles up the DOM tree.
 *
 * @param {HTMLElement} el - The target element to dispatch the mouse events on.
 * @param {number}      x  - The x-coordinate relative to the element's top-left
 * corner.
 * @param {number}      y  - The y-coordinate relative to the element's top-left
 * corner.
 *
 * @returns {undefined}
 */
function clickWithMouse(el, x, y) {
  if (!el) {
    console.error("Element not found");
    return;
  }

  const rect = el.getBoundingClientRect();
  const clientX = rect.left + x;
  const clientY = rect.top + y;

  // Find the actual element at the target coordinates to ensure we're clicking the right thing.
  const target = document.elementFromPoint(clientX, clientY);
  if (!target) {
      console.error("No element found at specified coordinates");
      return;
  }

  const clickLocation = {
    clientX: clientX,
    clientY: clientY,
    bubbles: true, // This is the crucial part to enable event bubbling.
    cancelable: true,
    view: window
  };

  // Dispatch events that will bubble up the DOM.
  target.dispatchEvent(new MouseEvent('mousedown', clickLocation));
  target.dispatchEvent(new MouseEvent('mouseup', clickLocation));
  target.dispatchEvent(new MouseEvent('click', clickLocation));
}

/**
 * Simulates a click on a specific gruop in a chart widget, identified by its
 * container ID and target group ID.
 *
 * @param {string} containerId    - The ID of the container element that holds
 * the chart.
 * @param {string} targetGroupID  - The group ID of the data point to click on.
 *
 * @returns {undefined}
 */
function clickWidgetPlotGroup(containerId, targetGroupID) {
  const canvas = document.querySelector(`#${containerId} canvas`);
  if (!canvas || !canvas.chart) {
    console.error("Canvas or chart instance not found for:", containerId);
    return;
  }

  const instance = canvas.chart;
  const data = instance.data.datasets[0].data;
  const xScale = instance.scales.x;
  const yScale = instance.scales.y;

  data.forEach(function(point) {
    if (point.GroupID === targetGroupID) {
      // Get the pixel coordinates for the point relative to the canvas
      const xpix = xScale.getPixelForValue(point.x);
      const ypix = yScale.getPixelForValue(point.y);

      // Use the abstracted function to simulate the click with element-relative coordinates
      clickWithMouse(canvas, xpix, ypix);
    }
  });
}

/**
 * Checks if a chart widget has finished loading by validating the presence of
 * a chart and checking certain chart properties.
 *
 * @param {string} containerId - The ID of the container element that holds the
 * chart.
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
