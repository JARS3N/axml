  Collect<-function(X){
    require(rvest)
    require(dplyr)
    list(
      CAL = CalData(X),
      LVL = get_lvls(X),
      PH_COEF=pH_coefs(X),
      Inst = getInst(X),
      sn = getSn(X),
      Lot = getLot(X),
      assay=determineAssay(X),
      file=getFile(X)
    )
  }
