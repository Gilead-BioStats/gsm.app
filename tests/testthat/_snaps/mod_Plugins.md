# mod_Plugins_UI creates the expected UI

    Code
      test_result
    Output
      <div class="tab-pane" title="Plugin Test" data-value="Plugin Test">
        <div id="testID--plugin" class="shiny-html-output"></div>
      </div>

# mod_Plugins_UI creates the expected UI with multiple plugins

    Code
      test_result
    Output
      $title
      [1] "Plugins"
      
      $menuName
      [1] "Plugins"
      
      $tabs
      $tabs[[1]]
      <div class="tab-pane" title="Plugin Test" data-value="Plugin Test">
        <div id="testID-001-plugin" class="shiny-html-output"></div>
      </div>
      
      $tabs[[2]]
      <div class="tab-pane" title="Plugin Test 2" data-value="Plugin Test 2">
        <div id="testID-002-plugin" class="shiny-html-output"></div>
      </div>
      
      
      $iconClass
      NULL
      
      $icon
      NULL
      
      $align
      [1] "left"
      
      attr(,"class")
      [1] "shiny.navbarmenu"

# mod_Plugins_UI creates the expected UI with required input

    Code
      test_result
    Output
      <div class="tab-pane" title="Plugin Test" data-value="Plugin Test">
        <div id="testID--plugin" class="shiny-html-output"></div>
      </div>

