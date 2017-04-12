  TargetEmissions<-function(X){
    Analyte<-axml::AnalyteIndex(X)
    xml_nodes(X,"TargetEmissionValue") %>% {setNames(xml_text(.),names(Analyte))}
  }
