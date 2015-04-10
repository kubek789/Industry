
#dane <- read.csv("dane//dane.csv", sep=";", dec=",")

#tabelka konwersji
hb1 <- read.csv("dane//hb1.csv", sep=";")
hb1

#konwersja HV->HB
hvhb<-hb1[!is.na(hb1$HB)&!is.na(hb1$HV),]
hvhb
fhvhb<-splinefun(hvhb$HV,hvhb$HB)
dane$WY4[is.na(dane$WY4)&!is.na(dane$WY8)]<-fhvhb(dane$WY8[is.na(dane$WY4)&!is.na(dane$WY8)])

#konwersja HRB->HB -nie robimy, bo nie ma HRB

#konwersja HRC->HB
hrchb<-hb1[!is.na(hb1$HB)&!is.na(hb1$HRC),]
hrchb
fhrchb<-splinefun(hvhb$HRC,hvhb$HB)
dane$WY4[is.na(dane$WY4)&!is.na(dane$WY5)]<-fhvhb(dane$WY5[is.na(dane$WY4)&!is.na(dane$WY5)])

#tabelka konwersji 2
hb2 <- read.csv("dane//hb2.csv", sep=";")
hb2<-hb2[,c(1,2)]
names(hb2)<-c("HB","HRA")
hb2

#konwersja HRA->HB
hrahb<-hb2[!is.na(hb2$HB)&!is.na(hb2$HRA),]
hrahb
fhrahb<-splinefun(hrahb$HRA,hrahb$HB)
dane$WY4[is.na(dane$WY4)&!is.na(dane$WY6)]<-fhrahb(dane$WY6[is.na(dane$WY4)&!is.na(dane$WY6)])
