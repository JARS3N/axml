pH_coefs<-function(X){
  n<-AnalyteIndex(X)['pH']
  coefs<- xml_nodes(X,'GainEquation') %>%
    lapply(.,xml_children) %>%
    .[[n]] %>%
    namesVec() %>%
    .[c("C3","C4")] %>%
    as.numeric() %>%
    setNames(.,c("slope","intercept")) %>%
    as.list()
 coefs$target<-  TargetEmissions(X) %>% .['pH'] %>% as.numeric()
 coefs$gain<-c((coefs$slope * coefs$target)+ coefs$intercept)
return(coefs)
}
