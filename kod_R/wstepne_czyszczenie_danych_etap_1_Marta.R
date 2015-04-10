# WCZYTYWANIE DANYCH:

dane <- read.csv2("dane\\dane.csv", header=TRUE)

# head(dane)
# dim(dane) # [1] 1515   42

# USUWANIE WIERSZY Z NA:

czyna <- numeric(nrow(dane))

for(i in 1:nrow(dane)){
  czyna[i] <- length(unique(unlist(dane[i,])))
}

dane <- dane[-which(czyna %in% 1:3),]

# dim(dane) # [1] 1446   42

# USUWANIE KOLUMN Z NA:

czyna <- numeric(ncol(dane))

for(i in 1:ncol(dane)){
  czyna[i] <- length(unique(dane[,i]))
}

names(dane)[which(czyna==1)] # usuwamy "WY7"
dane <- dane[, -which(names(dane)=="WY7") ]

# dim(dane) [1] 1446   41

# KOLUMNY UDZIAL PERITU I FERYTU (BO SIE WZAJEMNIE DOPELNIAJA):

pom <- ifelse(!is.na(dane$WE20), dane$WE20, 100-dane$WE21)
dane$WE20 <- pom
dane <- dane[,-which(names(dane)=="WE21")]

# dim(dane) [1] 1446   40

# KOLUMNY SREDNICA I WIELKOSC STEROIDOW (BO SIE WZAJEMNIE DOPELNIAJA):

dane$"WE18" <- as.character(dane$"WE18")
dane$"WE18"[which(dane$"WE18"=="6 i 7")] <- "6.5" 

for(i in which(!is.na(dane$"WE17"))){
  if(i < 1.5) dane$"WE18"[i] <- 8 else
    if (i < 3) dane$"WE18"[i] <- 7 else
      if (i < 6) dane$"WE18"[i] <- 6 else
        if (i < 12) dane$"WE18"[i] <- 5 else
          if (i < 25) dane$"WE18"[i] <- 4 else
            if (i < 50) dane$"WE18"[i] <- 3 else
              dane$"WE18"[i] <- 2
}

dane$"WE18" <- as.numeric(dane$"WE18")
dane <- dane[,-which(names(dane)=="WE17")]

# dim(dane) # [1] 1446   39


