create_tree_model <- function(df) {
    filter_df <- cbind(filter = TRUE, df)
    model <- rGtkDataFrame(filter_df)
    filter_model <- gtkTreeModelFilterNew(model)
    filter_model$setVisibleColumn(0)
    sort_model <- gtkTreeModelSort(filter_model)
    sort_model
}
