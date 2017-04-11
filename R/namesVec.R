namesVec<-function(u){
  setNames(xml2::xml_text(u),xml2::xml_name(u))
  }
