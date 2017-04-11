  determineAssay<-function(X){
    rvest::xml_node(X,'FileName') %>%
      xml2::xml_text() %>%
      toupper(.) %>%
      c("Gain"=grepl("GAIN",.),
        "Ksv"=grepl("KSV",.))%>%
        {names(.[.==TRUE])}
  }
