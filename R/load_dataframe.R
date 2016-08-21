load_dataframe <- function(df, name) {
    model <- create_tree_model(df)
    tree_view <- create_tree_view(model)
    vbox <- gtkVBox(FALSE, 5)
    scrolled_window <- gtkScrolledWindow()
    scrolled_window$add(tree_view)
    vbox$packStart(scrolled_window, TRUE, TRUE, 0)
    if (missing(name)) name <- deparse(substitute(df))
    notebook$appendPage(vbox, gtkLabel(name))
    }
