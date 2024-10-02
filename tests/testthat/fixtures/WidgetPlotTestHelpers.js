// Functions for simulating interactions with widget plots.

function clickWidgetPlotPoint(containerId, targetGroupID) {
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

      // Simulate mousedown, mouseup, and click events
      var mousedownEvent = new MouseEvent('mousedown', { clientX: clientX, clientY: clientY });
      canvas.dispatchEvent(mousedownEvent);

      var mouseupEvent = new MouseEvent('mouseup', { clientX: clientX, clientY: clientY });
      canvas.dispatchEvent(mouseupEvent);

      var clickEvent = new MouseEvent('click', { clientX: clientX, clientY: clientY });
      canvas.dispatchEvent(clickEvent);
    }
  });
}

function isWidgetPlotLoaded(containerId) {
  var canvas = document.querySelector(`#${containerId} canvas`);
  var chart = canvas && canvas.chart;
  return chart && chart.chartArea !== undefined && chart._animationsDisabled === true && chart.data.datasets.length > 0;
}
