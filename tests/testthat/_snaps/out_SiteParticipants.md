# out_SiteParticipants returns the expected UI

    Code
      simplified[[1]]
    Output
      <div class="datatables html-widget html-fill-item" id="htmlwidget-XXXX" style="width:100%;height:auto;"></div>

---

    Code
      simplified[[2]]
    Output
      <script type="application/json" data-for="htmlwidget-XXXX">{"x":{"filter":"none","vertical":false,"data":[["Analysis_kri0001","Analysis_kri0001","Analysis_kri0001","Analysis_kri0001","Analysis_kri0001","Analysis_kri0001"],["1350","0808","0010","0351","0975","0752"],["0X002","0X124","0X018","0X014","0X155","0X159"],["Site","Site","Site","Site","Site","Site"],[8,1,11,20,5,8],[715,792,727,881,709,847],[0.01118881118881119,0.001262626262626263,0.01513067400275103,0.02270147559591373,0.007052186177715092,0.009445100354191263]],"container":"<table class=\"compact\">\n  <thead>\n    <tr>\n      <th>SubjectID<\/th>\n      <th>NumeratorName<\/th>\n      <th>DenominatorName<\/th>\n      <th>MetricName<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"lengthChange":false,"paging":false,"searching":false,"selection":"none","columnDefs":[{"targets":6,"render":"function(data, type, row, meta) {\n    return type !== 'display' ? data : DTWidget.formatRound(data, 5, 3, \",\", \".\", null);\n  }"},{"targets":[1,4,5,6],"className":"dt-center"},{"name":"MetricID","targets":0},{"name":"SubjectID","targets":1},{"name":"GroupID","targets":2},{"name":"GroupLevel","targets":3},{"name":"Numerator","targets":4},{"name":"Denominator","targets":5},{"name":"Metric","targets":6}],"order":[],"autoWidth":false,"orderClasses":false},"callback":"function(table) {\n\n            table.on(\"click\", \"td:nth-child(1)\", function(d) {\n              const participant_id = d.currentTarget.innerText;\n              const namespace = table.table().container().parentNode.id;\n              const inputName = `${namespace}-participant`;\n              Shiny.setInputValue(inputName, participant_id);\n            })\n          \n}","selection":{"mode":"none","selected":null,"target":"row","selectable":null}},"evals":["options.columnDefs.0.render","callback"],"jsHooks":[]}</script>

