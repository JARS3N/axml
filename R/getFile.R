  getFile<-function(Z){
    xml_node(Z,'FileName') %>% xml_text() %>% basename()
  }
