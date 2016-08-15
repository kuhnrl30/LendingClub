FormatContent<- function(obj){
    obj$content<- unlist(obj$content,recursive = F)
    obj
}
