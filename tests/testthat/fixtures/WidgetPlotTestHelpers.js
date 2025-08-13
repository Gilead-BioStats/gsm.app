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
 * Simulates a click on a specific group in a chart widget, identified by its
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
 * Simulates a click on a specific group in a time series chart widget.
 *
 * @param {string} containerId    - The ID of the container element that holds the chart.
 * @param {string} targetGroupID  - The group ID of the data point to click on.
 * @param {string} flagType       - The type of flag to click on, either "red" or "amber".
 *
 * @returns {undefined}
 */
function clickTimeSeriesGroup(containerId, targetGroupID, flagType = "amber") {
  const canvas = document.querySelector(`#${containerId} canvas`);
  if (!canvas || !canvas.chart) {
    console.error("Canvas or chart instance not found for:", containerId);
    return;
  }

  const instance = canvas.chart;
  let data;
  if (flagType === "red") {
    data = instance.data.datasets[5].data;
  } else {
    data = instance.data.datasets[6].data;
  }

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
 * Checks if a chart widget has finished loading. This function is designed to be
 * robust for use in automated testing environments.
 *
 * @param {string} containerId - The ID of the container element that holds the
 * chart.
 *
 * @returns {boolean} True if the widget is fully loaded, false otherwise.
 */
function isCanvasLoaded(containerId) {
    const canvas = document.querySelector(`#${containerId} canvas`);

    // 1. Basic Checks: Ensure the canvas element exists and is visible.
    if (!canvas || canvas.width === 0 || canvas.height === 0) {
        return false;
    }

    const rect = canvas.getBoundingClientRect();
    if (rect.width === 0 || rect.height === 0 || rect.top > window.innerHeight || rect.left > window.innerWidth) {
        return false;
    }

    // 2. Chart.js Instance Check
    const chart = canvas.chart;
    if (!chart) {
        return false;
    }

    // 3. Animation Check
    if (chart.animating || (chart.options.animation && chart.animating)) {
        return false;
    }

    // 4. Full Pixel Scan: Check that the canvas isn't blank (all one color or transparent).
    const context = canvas.getContext('2d');
    if (!context) {
        return false;
    }

    const imageData = context.getImageData(0, 0, canvas.width, canvas.height).data;
    let firstVisibleColor = null;

    for (let i = 0; i < imageData.length; i += 4) {
        // Check if the pixel is visible (alpha > 0).
        if (imageData[i + 3] > 0) {
            const currentColor = [imageData[i], imageData[i+1], imageData[i+2], imageData[i+3]].join(',');

            if (firstVisibleColor === null) {
                // This is the first visible pixel we've found.
                firstVisibleColor = currentColor;
            } else if (currentColor !== firstVisibleColor) {
                // We found a second, different visible color. The chart is rendered.
                return true;
            }
        }
    }

    // If the loop completes, one of two conditions is met:
    // 1. No visible pixels were found (firstVisibleColor is null).
    // 2. All visible pixels are the exact same color.
    // In either case, the chart is considered not fully loaded.
    return false;
}
