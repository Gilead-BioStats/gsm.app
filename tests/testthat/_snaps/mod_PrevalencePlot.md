# PlotPrevalencePlot generates the expected plot

    Code
      mod_PrevalencePlot_UI("test")
    Output
      <div class="bars html-widget html-widget-output shiny-report-size html-fill-item" id="test-plot" style="width:100%;height:500px;"></div>

# PreparePrevalenceCounts sets up the prevalence df

    Code
      dfPrevalence
    Output
      # A tibble: 18 x 4
         VizLevel    VizCategory     n    pct
         <fct>       <fct>       <int>  <dbl>
       1 Study       f               5 0.05  
       2 Study       i               9 0.09  
       3 Study       m               7 0.07  
       4 Study       s              11 0.11  
       5 Study       w               5 0.05  
       6 Study       Other          63 0.63  
       7 Group       f               1 0.0323
       8 Group       i               2 0.0645
       9 Group       m               3 0.0968
      10 Group       s               3 0.0968
      11 Group       w               1 0.0323
      12 Group       Other          21 0.677 
      13 Participant f               0 0     
      14 Participant i               1 0.111 
      15 Participant m               1 0.111 
      16 Participant s               0 0     
      17 Participant w               0 0     
      18 Participant Other           7 0.778 

