
  CollectNoLVL<-function(X){
    require(XML)
    require(dplyr)
    list(
      CAL = CalData(X),
      calStartTemp=calStartTemp(X),
      PH_COEF=pH_coefs(X),
      O2_COEF=O2_coefs(X),
      Inst = getInst(X),
      sn = getSn(X),
      Lot = getLot(X),
      assay=determineAssay(X),
      file=getFile(X)
    )
  }
