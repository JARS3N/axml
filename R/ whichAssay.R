  whichAssay<-function(X){
    type<-substr(X$Lot,1,1)
    if(type=="C"){
      ComboAssay(X)
    }else{
      assay(X)
    }
  }
