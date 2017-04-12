get_lvls<-function(X){
  TickTable<-function(X){
    data.frame(
      start=xml_nodes(X,'StartTickIndex') %>%
        xml_text() %>% as.numeric() ,
      end=xml_nodes(X,'EndTickIndex') %>%
        xml_text() %>% as.numeric()
    ) %>% mutate(.,Measure=seq(nrow(.))) %>%
      rowwise() %>%
      do(data.frame(Tick=seq(.$start,.$end),Measure=.$Measure))
  }
  
  getcounts<-function(x){
    counts<-xml_nodes(x,'CorrectedEmissionValues') %>% 
      lapply(.,{. %>%
          xml_children %>%
          xml_text() %>% 
          as.numeric()})
    analytes<- xml_nodes(x,'AnalyteName') %>% 
      xml_text() 
    setNames(counts,analytes) %>% 
      bind_cols() %>% 
      mutate(.,Well=seq(nrow(.)))
  }
  
  xml_nodes(X,"AnalyteDataSetsByAnalyteName") %>% 
  lapply(.,getcounts) 
  mapply(function(x,y){mutate(x,Tick=y) %>% bind_cols()},B,seq(B),SIMPLIFY = F)  %>% 
  bind_rows() %>% 
  inner_join(.,TickTable(X),by='Tick')

}#end
