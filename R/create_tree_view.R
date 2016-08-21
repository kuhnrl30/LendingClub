create_tree_view <- function(model) {
    tree_view <- gtkTreeView(model)
    rdf <- model$getModel()$getModel()
    sapply(tail(seq_len(ncol(rdf)), -1), function(j) {
        renderer <- gtkCellRendererText()
        column <- gtkTreeViewColumn(colnames(rdf)[j], renderer, text = j - 1)
        column$setSortColumnId(j - 1)
        column$setCellDataFunc(renderer,
                               function(column, renderer, model, iter)
                               {iter <- model$convertIterToChildIter(iter)$child.iter
                               child <- model$getModel()
                               iter <- child$convertIterToChildIter(iter)$child.iter
                               i <- rdf$getPath(iter)$getIndices()[[1]] + 1
                               renderer["text"] <- as.character(rdf[i, j])
                               })
        tree_view$appendColumn(column)
    })
    
    tree_view$setHeadersClickable(TRUE)
    if (is.null(gtkCheckVersion(2, 10, 0))) tree_view$setGridLines("both")
    tree_view
    }