get_input_label <- function(
    old_label
) {
    new_label <- c(
        'Group' = 'Analyze by',
        'Threshold' = 'Thresholds',
        'Method' = 'Statistical Method',
        'Minimum Denominator' = 'Minimum KRI Denominator'
    )

    new_label[old_label]
}
