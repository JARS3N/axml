  getSn<-function(u){
    sn <-xml_node(u,'Cartridge') %>%
      xml_node('Serial') %>%
      xml_text()
    if(length(sn)!=0&sn!=""){
      return(sn)
    }else{
      regexp<-"_[0-9]{1,3}_"
      x<-getFile(u)
      sn<- unlist(regmatches(x, gregexpr(regexp, x)))
      sn<-gsub("_","",sn)
      return(sn)
    }
  }
