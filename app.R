# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file
pkgload::load_all(".")

qs::set_trust_promises(TRUE)
gsmApp::run_app()
