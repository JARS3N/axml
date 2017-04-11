
  Ksv<-function(X){
    group_by(X$LVL,Measure) %>%
      filter(.,Tick %in% c(max(Tick)-2,max(Tick)-1,max(Tick))) %>%
      ungroup(.) %>%
      group_by(.,Well,Measure) %>% summarise(.,avgO2lvl=mean(O2lvl)) %>%
      mutate(.,Measure=c("Ambient","F0")[Measure])%>%
      tidyr::spread(.,Measure,avgO2lvl) %>%
      mutate(.,KSV=((F0/Ambient)-1)/152) %>%
      merge(.,X$CAL,by='Well')
  }
