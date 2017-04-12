 newGain<-function(X){
    filter(X$LVL,Tick %in% c(max(Tick)-2,max(Tick)-1,max(Tick))) %>%
      group_by(.,Well) %>% summarise(.,sorpH=mean(pHlvl)) %>%
      merge(.,X$CAL,by='Well') %>%mutate(.,Target=X$PH_COEF$target) %>%
      mutate(.,Gain=(Target/pH.CalibrationEmission)*(1/800)*(pH.CalibrationEmission-sorpH))
 }
