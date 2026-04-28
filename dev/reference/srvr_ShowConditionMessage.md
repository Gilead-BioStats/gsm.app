# Modal dialog for errors etc

Modal dialog for errors etc

## Usage

``` r
srvr_ShowConditionMessage(
  cnd,
  strTitle,
  chrPreMessage = character(),
  chrPostMessage = character(),
  strDismiss = "Dismiss"
)
```

## Arguments

- cnd:

  `condition` The condition object.

- strTitle:

  `length-1 character` A title for the modal popup.

- chrPreMessage:

  `character` One more more messages to show before the condition
  message.

- chrPostMessage:

  `character` One or more messages to show after the condition message.

- strDismiss:

  `length-1 character` Text to show on the dismiss button.

## Value

A
[`shiny::modalDialog()`](https://rdrr.io/pkg/shiny/man/modalDialog.html)
with the designated text, launched via
[`shiny::showModal()`](https://rdrr.io/pkg/shiny/man/showModal.html).
