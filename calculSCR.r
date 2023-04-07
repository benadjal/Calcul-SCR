library(dplyr)

#Importaiton de la base d'actifs
Base_Actif <- read.csv2(file = "./baseActifs")



#Choc sur les actifs
choc_immo <- 0.3
choc_action <- 0.39

#Calcul de la VM de choquee
Base_Actif %>% 
  mutate(VM_choc = ifelse(Classe_actif == "Immobilier", VM * (1- choc_immo), ifelse(Classe_actif == "Action", VM * (1- choc_action), VM)))

#Calcul du SCR brut
SCR_brut <- sum(Base_Actif$VM)-sum(Base_Actif$VM_choc)
SCR_brut