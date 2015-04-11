# ZMIENNE Z ZAWARTOSCIA PIERWIASTKA PRZEKSZTALCAMY LOGARYTMICZNIE, TWORZAC NOWE ZMIENNE NP. WY4_MOD

ktore <- 1:14

nazwy <- stri_paste("WE", ktore, "_mod", sep="")

m <- matrix(0, ncol=length(ktore), nrow=nrow(dane))

for(i in ktore){
  m[,i] <- log(0.1+dane[,ktore[i]+1])
}

m <- as.data.frame(m)
colnames(m) <- nazwy

dane <- cbind(dane, m)