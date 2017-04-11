  O2_coefs<-function(X){
    Analyte<-AnalyteIndex(X)
    coefs<- list(
      "target"= TargetEmissions(X) %>% .['O2'] %>% as.numeric(),
      "KSV"=xml_nodes(X,"CorrectedKsv")  %>% xml_text() %>% as.numeric()
    )
    coefs
  }
