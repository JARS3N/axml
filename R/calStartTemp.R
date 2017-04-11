  calStartTemp<-function(Z){
    xml_nodes(Z,'AssayDataSet') %>%
      xml_nodes('CalibrationStartTemperature') %>%
      xml_text()
  }
