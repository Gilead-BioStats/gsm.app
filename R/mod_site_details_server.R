site_details_server <- function(id, snapshot, site) {
    moduleServer(id, function(input, output, session) {
        #print(site())
        #output$site_metadata <- reactive({
        #    req(site())
        #})

        #output$participants <- reactive({
        #    req(site())
        #})
    })
}
