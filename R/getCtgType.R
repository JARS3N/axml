getCtgType<-function(Z){
    Ltr<- xml_nodes(Z,'Cartridge') %>%
      xml_node('Type') %>% xml_text()
    if (length(Ltr)==0 |Ltr== ""){
      Ltr<-getCtgTypefromInst(Z)
    }
    Ltr
  }
