HTMLWidgets.widget({
    name: 'widget_scatter_plot',
    type: 'output',
    factory: function(el, width, height) {
        return {
            renderValue: function(inputs) {
                inputs.config.selectedGroupIDs = inputs.siteid;

                // Define custom click callback that updates site select in Shiny app.
                inputs.config.clickCallback = function(d) {
                    instance.data.config.selectedGroupIDs = instance.data.config.selectedGroupIDs.includes(d.groupid)
                        ? 'None'
                        : d.groupid;

                    if (!!Shiny) {
                        console.log(
                            `Selected site ID: ${instance.data.config.selectedGroupIDs}`
                        );

                        //const namespace = el.id.split('-')[0];
                        const namespace = 'gsmApp';

                        Shiny.setInputValue(
                            'site',
                            instance.data.config.selectedGroupIDs
                        );
                    }

                    instance.helpers.updateConfig(
                        instance,
                        instance.data.config
                    );
                };

                // generate scatter plot
                const instance = rbmViz.default.scatterPlot(
                    el,
                    inputs.data,
                    inputs.config,
                    inputs.bounds
                );
            },
            resize: function(width, height) {
            }
        };
    }
});
