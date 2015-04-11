library("arules")

dyskretyzacja<-function(data,kolumna,l_kategorii){
  
  granice<-discretize(data[,kolumna],method="frequency",categories=l_kategorii,labels=1:l_kategorii,onlycuts=TRUE)
  granice[1]<--Inf
  granice[length(granice)]<-+Inf
  k<-length(granice)-1
  w<-data[,kolumna]
  for(i in 1:k){
    w[data[,kolumna]>granice[i]&data[,kolumna]<=granice[i+1]]<-i
  }
  w<-data.frame(w)
  colnames(w)<-paste(kolumna,"_mod",sep="")
  return(w)
}

dane<-cbind(dane,dyskretyzacja(dane,"WE25",10))
dane<-cbind(dane,dyskretyzacja(dane,"WE26",10))
dane<-cbind(dane,dyskretyzacja(dane,"WE27",8))
dane<-cbind(dane,dyskretyzacja(dane,"WE28",7))
