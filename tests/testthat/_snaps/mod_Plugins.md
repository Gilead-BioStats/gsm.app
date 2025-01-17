# mod_Plugins_UI creates the expected UI

    Code
      test_result
    Output
      <div class="tab-pane" title="Plugin Test" data-value="Plugin Test">TestUI</div>

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
      <div class="tab-pane" title="Plugin Test" data-value="Plugin Test">TestUI</div>
      
      $tabs[[2]]
      <div class="tab-pane" title="Plugin Test 2" data-value="Plugin Test 2">TestUI 2</div>
      
      
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
        <div id="testID-1" class="shiny-html-output"></div>
      </div>

# mod_Plugins_Server outputs the expected result with required inputs

    Code
      output$`1`$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a site and a participant.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

---

    Code
      output$`1`$html
    Output
      <div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container placeholder" data-bslib-card-init data-require-bs-caller="card()" data-require-bs-version="5">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">Please select a participant.</div>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

---

    Code
      output$`1`$html
    Output
      This is a UI

