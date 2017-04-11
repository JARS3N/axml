  TargetEmissions<-function(X){
    xml_nodes(X,"TargetEmissionValue") %>% {setNames(xml_text(.),names(Analyte))}
  }
