  getLot<-function(X){
    Lot<-paste0(
      xml_node('Cartridge') %>% xml_node("Type") %>% xml_text(),
      xml_node('Cartridge') %>% xml_node("Lot") %>% xml_text()
    )
    if (length(Lot)==0|Lot==""){
      flx<-getFile(X)
      regexp<-"[W|B|C|Q|T]{1}[E|0-9]{1}[0-9]{4}"
      Lot<- paste0(unlist(regmatches( flx, gregexpr(regexp, flx))))
    }
    return(Lot)
  }
