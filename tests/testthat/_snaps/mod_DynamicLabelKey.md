# mod_DynamicLabelKey_UI creates expected UI

    Code
      mod_DynamicLabelKey_UI("test")
    Output
      <span id="test">
        by
        <span id="test-key" class="shiny-html-output"></span>
      </span>

# mod_DynamicLabelKey_Server dynamically generates HTML labels

    Code
      output$key$html
    Output
      <span class="label-key" style="background-color:#1b9e77;">Study</span>

---

    Code
      output$key$html
    Output
      <span class="label-key" style="background-color:#1b9e77;">Study</span> and <span class="label-key" style="background-color:#d95f02;">GROUP_SET</span>

---

    Code
      output$key$html
    Output
      <span class="label-key" style="background-color:#1b9e77;">Study</span>, <span class="label-key" style="background-color:#d95f02;">GROUP_SET</span>, and <span class="label-key" style="background-color:#7570b3;">SUBJECT_SET</span>

