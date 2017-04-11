 assay<-function(X){
    AL<-list("Gain"=axml::newGain,"Ksv"=axml::Ksv)
    AL[[X$assay]](X) %>%
      merge(.,data.frame(sn=X$sn,Inst=X$Inst,Lot=X$Lot))
  }

