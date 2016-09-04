GUI_Headers<- function(x){
    names(x)<- gsub("([A-Z])","\n\\1",names(x))
    names(x)<- gsub("^([[:alpha:]])", "\\U\\1", names(x), perl=TRUE)
    x
    }
