 assay<-function(X){
    AL<-list("Gain"=PipeFish::newGain,"Ksv"=PipeFish::Ksv)
    AL[[X$assay]](X) %>%
      merge(.,data.frame(sn=X$sn,Inst=X$Inst,Lot=X$Lot))
  }

