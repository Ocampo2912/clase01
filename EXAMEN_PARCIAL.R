
### PARTE 1 ####
 
var <- function(elevacion){
  for (x in elevation){
    if (elevacion >=1000 | elevacion <= 3000){
  }
  
    
  } 
}



x <- 0
if (x < 0) {
  print("Numero negativo")
} else if (x > 0) {
  print("Numero positivo")
} else {
  print("Cero")
}

#2. sistema de ecuaciones 

"3a + 2b - 2c = 0
2a - 1b+3c =9
a+4b+2c = -4 "

a <- rbind(c(3,2,-2), c(2,-1,3), c(1,4,2))
b <- c(0,9,-4)
solve(a)

(resp<- solve(a)%*%b)


######### PARTE 2 #########

library(tidyverse)
library(readr)
library(tidyverse)
library(dplyr)

#Cargando el conjunto de datos 

data<-read.csv("data/mods_clima_uh.csv")
head(datos)
names(datos)
datos <- tibble(data)
tail(datos$bh_esc)
#se solicita lo sgte:

#a. Precipitación acumulada anual (Valores observados) para la cuenca asignada. 

#cuenca chala 

(chala<- datos %>% 
  dplyr:: filter(uh_name == "Cuenca Chala") %>% 
  group_by(bh_esc = "Observado") %>% 
  summarise(pp_acum = sum(bh_pc, na.rm= T)))


###### PARTE 3 ###########3

"temperatura diaria (1928-2015)"

dt<- read.csv("data/temperatureDataset.csv")


temp<-tibble(dt)
grupo8<- temp %>% 
  dplyr::select("DATE","qc00000746") %>%  
  mutate_all(funs(replace(., .=="-99.9",NA)) ) %>% 
  mutate(DATE=as.Date(DATE, format= "%d/%m/%Y"))


#a. cantidad missing values sep 1983- agost 1984 y sep 1997- agost 1998


  #AÑOS 1983 A 1984
VAl_NA<- grupo8 %>% 
  mutate(DATE=as.Date(DATE, format= "%d/%m/%Y")) %>% 
  dplyr::filter(DATE >= "1983-09-01" & DATE <= "1984-08-31")
  
(cant_NA<- sum(is.na(VAl_NA$qc00000746)))

  #AÑOS 1997 A 1998
VAl_NA2<- grupo8 %>% 
  mutate(DATE=as.Date(DATE, format= "%d/%m/%Y")) %>% 
  dplyr::filter(DATE >= "1997-09-01" & DATE <= "1998-08-31")

(cant_NA2<- sum(is.na(VAl_NA2$qc00000746)))

#b. serie de tiempo temp mensual ( si na en un mes , supera el 5%, la temp mensual es NA) y plotear 

temp_mes <- grupo8 %>% 
  group_by(DATE= str_sub(DATE,1,7)) %>%
  mutate(miss_val = sum(is.na(qc00000746))*100/n()) %>% 
  summarise(tt_mes = sum(qc00000746, na.rm = T ), 
            miss_val = unique(miss_val)) %>% 
  mutate(tt_mes= ifelse( miss_val >=5, NA , tt_mes),
         DATE=as.Date(sprintf("%1$s-01", DATE)),
         Mes=str_sub(DATE, 6,7))
 
 #plotear

ggplot(data = temp_mes, mapping = aes(x=DATE, y= tt_mes)) +
  geom_line(color = "blue") + 
  labs(y ="Temperatura", x= "Años analizados") + 
  ggtitle("Temperatura mensual") + 
  theme(plot.title = element_text(vjust = 2 , hjust = 0.5)) + 
  theme(axis.title.y = element_text( vjust = 2.5))+
  theme(axis.title.x = element_text(vjust = -0.5))

#la figura presenta muchos datos NA a partir del año 1928 hasta el año 1960 , donde se inicia a registrar la temperatura. 


#c. cantidad de missing value de serie de tiempo a paso mensual para los años 2005 y 2010.

ct_NA<- temp_mes %>% 
  mutate(DATE=as.Date(DATE, format= "%d/%m/%Y")) %>% 
  dplyr::filter(DATE >= "2005-01-01" & DATE <= "2010-12-31")

(cant_NA01<- sum(is.na(ct_NA$qc00000746)))


#d. funcion que apartir de tem_mensual calcule la climatologia (Ene-Dic)

#periodo 1980-1995 y 1996-2010

(clim <- temp_mes%>% 
  dplyr::filter(DATE >= "1980-01-01" & DATE <= "1995-12-31") %>% # filtramos el periodo que nos pide
  group_by(DATE=str_sub(DATE, 6,7)) %>% 
  summarise(tt_mes = mean(tt_mes, na.rm = T)))



clima <- function(x, y){
  x = as.Date(x, format = "%Y-%m-%d")
  y = as.Date(y, format = "%Y-%m-%d")
  
  clim <- temp_mes %>% 
    dplyr::filter(DATE >= x & DATE<=y) %>%
    group_by(DATE=str_sub(DATE, 6,7)) %>% 
    summarise(tt_mes = mean(tt_mes, na.rm = T))
  
  return(clim)
}

(periodo1 <- clima("1980-01-01", "1995-12-31"))
(periodo2 <- clima("1996-01-01", "2010-12-31"))

#plotear

datos <- read.table(file=url, header=T)

par(mfrow=c(1, 2))
plot(x=periodo1$DATE, y=periodo1$tt_mes, pch='o',
     xlab= "Mes",
     ylab='Temperatura')
plot(x=periodo1$DATE, y=periodo1$tt_mes, pch='o',
     xlab= "Mes",
     ylab='Temperatura')

#e. Plotear con boxplot variablidad mensual de valores mensuales Ene-Dic Periodo 1980-2013 y describirlo 

(var_mensual <- temp_mes %>% 
    dplyr:: filter(DATE >="1980-01-01" & DATE < "2013-12-31"))

ggplot(var_mensual, aes(Mes, tt_mes)) +
  geom_boxplot(fill= "red") + 
  theme_bw()+
  scale_x_discrete(
    labels = month.abb) +
  ggtitle("Variablidad de la temperatura mensual (1980-2013)") + 
  theme(plot.title = element_text(vjust = 2, hjust = 0.5)) +
  labs(y="Temperatura mensual") +
  theme(axis.title = element_text(vjust = 2.5))



