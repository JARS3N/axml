  ComboAssay<-function(X){
    require(tidyr)
    Dat<-  list(
      pHgain=filter(X$LVL,Measure==1)%>%
        filter(.,Tick %in% c(max(Tick)-2,max(Tick)-1,max(Tick))) %>%
        group_by(.,Well) %>% summarise(.,sorpH=mean(pHlvl)) %>%
        merge(.,X$CAL,by='Well') %>%mutate(.,Target=X$PH_COEF$target) %>%
        mutate(.,Gain=(Target/pH.CalEmission)*(1/800)*(pH.CalEmission-sorpH)),
      O2gain=group_by(X$LVL,Measure) %>%
        filter(.,Tick %in% c(max(Tick)-2,max(Tick)-1,max(Tick))) %>%
        ungroup(.) %>%
        group_by(.,Well,Measure) %>% summarise(.,avgO2lvl=mean(O2lvl)) %>%
        mutate(.,Measure=c("Ambient","F0")[Measure])%>%
        spread(.,Measure,avgO2lvl) %>%
        mutate(.,KSV=((F0/Ambient)-1)/152) %>%
        ungroup(.) %>%
        mutate(Well=as.numeric(Well))
    )
    merge(Dat$pHgain,Dat$O2gain,by='Well') %>%
      mutate(.,Inst=as.character(X$Inst))%>%
      mutate(.,sn=as.character(X$sn)) %>%
      mutate(.,Lot=as.character(X$Lot))
  }
