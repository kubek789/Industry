#ETAP 3 - WYRZUCENIE kolumn WY5-WY8 (pozostale twardosci)

dowyrzucenia<-c("WY5","WY6","WY7","WY8")
w<-match(dowyrzucenia,colnames(dane))
w<-w[!is.na(w)]
dane<-dane[,-w]
head(dane)
dane$WY4
