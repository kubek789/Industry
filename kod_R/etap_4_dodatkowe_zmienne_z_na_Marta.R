# STWORZENIE DODATKOWYCH ZMIENNYCH, Z INFORMACJA, GDZIE BYLO NA

nazwy <- stri_paste(names(dane), "_NA")[-1]
m <- matrix(0, ncol=length(nazwy), nrow=nrow(dane))

for(i in 2:ncol(dane)){
  m[,i-1] <- as.numeric(is.na(dane[,i]))
}

m <- data.frame(m)
colnames(m) <- nazwy

dane <- cbind(dane, m)




