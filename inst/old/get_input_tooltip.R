get_input_tooltip <- function(
    label
) {
    tooltip <- c(
        'Group' = 'Stratum by which to run analysis',
        'Threshold' = 'KRI flagging thresholds - positive thresholds flag over-reporting and negative thresholds flag under-reporting',
        'Method' = 'Statistical method applied to score KRI metric',
        'Minimum Denominator' = 'Minimum accumulation of data required to evaluate KRI'
    )

    tooltip[label]
}
