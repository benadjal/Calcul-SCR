library(dplyr)

#Importaiton de la base d'actifs
Base_Actif <- read.csv2(file = "./baseActifs")



#Choc sur les actifs
choc_immo <- 0.3

#Calcul de la VM de choquee
Base_Actif %>% 
  mutate(VM_choc = VM * (1- choc_immo))

#Calcul du SCR brut
SCR_brut <- sum(Base_Actif$VM)-sum(Base_Actif$VM_choc)
SCR_brut