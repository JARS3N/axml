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
    tick_level<-function(h){
      xml_nodes(h,'CorrectedEmissionValues') %>%
      {setNames(
        lapply(.,{. %>%
            xml_children %>%
            xml_text()}),
        xml_nodes(h,'AnalyteName') %>% xml_text() %>% as.numeric()
      ) %>%
          bind_cols()} %>%
        mutate(.,Well=seq(nrow(.)))
    }
    xml_nodes(X,"AnalyteDataSetsByAnalyteName") %>%
      lapply(testFn) %>%
      {lapply(seq(.),function(u){mutate(.[[u]],Tick=u)})
      } %>%
      bind_rows() %>%
      rename(.,pH.LVL=pH,O2.LVL=O2) %>%
      merge(.,TickTable(X),by='Tick')

  }
