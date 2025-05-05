---
name: "Plugin Issue Template"  
about: "Develop a new plugin"
title: "Plugin: ProvideATitle"
---
## Plugin Details
<!--- What does this plugin help users dive deeper into? -->

## Input

### Core Inputs
<!-- Which core inputs will be used by or manipulated within this plugin? -->
- [ ] `rctv_strGroupID`
- [ ] `rctv_strGroupLevel`
- [ ] `rctv_strMetricID`
- [ ] `rctv_strSubjectID`
- [ ] `rctv_strPrimaryNavBar`
- [ ] `rctv_strDomainID` (when/if it becomes available)
- [ ] `rctv_lDomainRowsSelected` (when/if it becomes available)

### Domains
<!-- Which domain(s) are used by this plugin? -->
- [ ] Adverse Events (AE)
- [ ] Data Changes (DATACHG)
- [ ] Data Entry (DATAENT)
- [ ] Enrollment (ENROLL)
- [ ] Lab (LB)
- [ ] Protocol Deviations (PD)
- [ ] Queries (QUERY)
- [ ] Study Completion (STUDCOMP)
- [ ] Subject Metadata (SUBJ)
- [ ] Treatment Completion (SDRGCOMP)

### Other Arguments
<!-- Are there other things that the app-launcher will need to provide for this plugin? -->

## Output

### Core Inputs
<!-- Which core inputs will users be able to select inside the app? These values should be returned by the server side of the app in a `list()` of `shiny::reactive()` or `shiny::reactiveVal()` objects, with names matching the names below. -->
- [ ] `rctv_strGroupID`
- [ ] `rctv_strGroupLevel`
- [ ] `rctv_strMetricID`
- [ ] `rctv_strSubjectID`
- [ ] `rctv_strDomainID`
- [ ] `rctv_strPrimaryNavBar`
- [ ] `l_rctvDomainRowsSelected` (when/if it becomes available)

### New Inputs
<!--- Does this plugin allow users to select new things, which might be useful to other plugins? -->

## Existing Implementations
<!--- Are there existing implementations of roughly what this plugin should do? Perhaps we can reuse those. -->

## Additional Comments
<!--- Not required, anything else import pertaining to this plugin -->
