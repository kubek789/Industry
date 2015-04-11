macierz<-as.matrix(dane)
macierz<-matrix(as.numeric(macierz),ncol=ncol(macierz),nrow=nrow(macierz),dimnames=list(NULL,colnames(macierz)))
cor(macierz,na.rm=TRUE)
write.table(dane,"dane\\dane_po_etapie_4.txt",quote=F,row.names=FALSE)

sort(1-apply(dane,2,function(x){
  sum(is.na(x))
})/dim(dane)[1])

dane1<-dane[!is.na(dane$WE2)&!is.na(dane$WE1)&!is.na(dane$WE27)&!is.na(dane$WE25)&!is.na(dane$WE28)&!is.na(dane$WE6)&!is.na(dane$WE26)&!is.na(dane$WE3)&!is.na(dane$WE4)&!is.na(dane$WE5)&!is.na(dane$WE7)&!is.na(dane$WE8),]
nrow(dane[!is.na(dane$WE2)&!is.na(dane$WE1)&!is.na(dane$WE27)&!is.na(dane$WE25)&!is.na(dane$WE28)&!is.na(dane$WE6)&!is.na(dane$WE26)&!is.na(dane$WE3)&!is.na(dane$WE4)&!is.na(dane$WE5)&!is.na(dane$WE7)&!is.na(dane$WE8),])
nrow(dane)

kolumny<-paste(c(paste("WE",1:8,sep=""),paste("WE",25:28,sep="")),"_mod",sep="")
model1<-lm(WE8_mod~.,data=dane[!is.na(dane$WE2)&!is.na(dane$WE1)&!is.na(dane$WE27)&!is.na(dane$WE25)&!is.na(dane$WE28)&!is.na(dane$WE6)&!is.na(dane$WE26)&!is.na(dane$WE3)&!is.na(dane$WE4)&!is.na(dane$WE5)&!is.na(dane$WE7)&!is.na(dane$WE8),kolumny])
summary(model1)
model2<-step(model1,direction="backward",k=log(nrow(dane1)))
#sprobowac lasso