  getFile<-function(Z){
    
    rvest::xml_node(Z,'FileName') %>% xml2::xml_text() %>% basename()
  }
