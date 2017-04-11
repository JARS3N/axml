  AnalyteIndex<-function(X){
    xml_node(X,'AnalyteCalibrationsByAnalyteName') %>%
      xml_nodes('Key') %>%
      xml_text() %>%
      setNames(c(1:2),.)
  }
