  CalData<-function(X){
    Analyte<-AnalyteIndex(X)
    ReduceCal<-function(X,val){
      xml_nodes(X,val) %>%
        setNames(.,names(Analyte)) %>%
        lapply(.,xml_children) %>%
        lapply(.,xml_contents) %>%
        lapply(.,xml_text) %>%
        bind_cols() %>%
        {setNames(.,
                  paste0(
                    names(.),".",
                    gsub("Values","",val)
                  ))}
    }


    c("LedValues","CalibrationEmissionValues","IntialReferenceDeltaValues") %>%
      lapply(.,{. %>% ReduceCal(X,.)}) %>%
      bind_cols() %>%
      mutate_all(.,funs(as.numeric)) %>%
      mutate(Well=seq(nrow(.))) %>%
      bind_cols(.,
                ReduceCal(X,"LedStatusValues")
      )
  }
