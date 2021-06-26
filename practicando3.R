#LISTAS

"A diferencia de un vector, una lista es una colección de elementos que pueden ser 
de diferente tipo. Los componentes de una lista son 
típicamente pares clave-valor (key-value)."

# Los elementos de la lista generalmente se acceden por nombre
coordenadas <- list(x = 10, y = 15)
coordenadas

point <- list(id = 123, coord = coordenadas, spatial.reference = "WGS_84")
point

point$id

# También podemos acceder a sus elementos de la siguiente manera
point[1]

class(point[1])

# Para obtener el valor del elemento de la lista, use corchetes dobles
point[[1]]

class(point[[1]])

#LECTURA / ESCRITURA DE DATOS (.CSV, .XLSX, .RDATA, .RDS)

#intalar paquete readr
installed.packages("readr")

#cargar paquete readr
library(readr)


# datos será un 'data frame'
data01 <- read_csv(file = 'file.csv')
head(data01)


# datos será un 'tibble'
data01 <- readr::read_csv(file = 'file.csv')
data01

#En otros casos, cuando ";" es utilizado como el separador de campo 
#y "," para el punto decimal, se utiliza una variante de estas funciones.

# datos será un 'data frame'
data02 <- read.csv(file = 'file.csv', sep = ',', header = T)
data02 <- read.csv(file = 'file.csv', sep = ',', header = F)

readr::write_csv(x = data02, file = "csv_data.csv")

head(data02)

##EXCEL

"Es posible leer datos en la forma .xls o .xlsx. 
Existen distintos paquetes que nos permiten hacerlo:
  
  El paquete readxl contiene la función read_excel.
El paquete xlsx y la función read.xlsx"

installed.packages("readxl")
library(readxl)


# datos será un 'data frame'
data03 <- readxl::read_xls(path = 'file.xls', sheet = 1)
data03 <- xls::read.xls(file = "file.xls", 1)

####EJERCICIO 1:

#intalar paquete readr
installed.packages("readr")

#cargar paquete readr
library(readr)


# datos será un 'data frame'
archivo <- read_csv(file = 'data/earthquakes.csv')
head(archivo)

str(archivo)
archivo$Magnitude
archivo[,"Magnitude"]

head(archivo[archivo$Magnitude == 6,]) # ejm:archivo[2,4] donde 2 es la fila2 y 4 es la columna 4
length(archivo[archivo$Magnitude == 6,])

head(archivo[archivo$Magnitude == 6, c("DateTime","Magnitude")])
head(archivo[archivo$Latitude >= 18 & archivo$Longitude >= 70, ])

subset(archivo,Latitude >= 18 & Magnitude == 6)

dim(archivo) # para hallar los registros 

archivo[, "Magnitude"]
archivo[10,5]
archivo[10,"Magnitude"]

"Nota 1: Recuerden cargar todas las librerias necesarias en caso no lo hayan hecho.
Nota 2: Fijense en su directorio de trabajo (working directory)
Nota 3: Copia para no perder los datos originales (buena práctica)
Obtener un dataset con todos los distritos que tienen 0 en la columna Incidencia. (tener cargado el dataset data/pobreza_extrema.csv)

Convertir al distrito “Los Olivos” en el de más extrema pobreza la variable Incidencia. Luego explorar los datos.

Crear un data frame que tenga todos los distritos de la región Ancash e Ica sin población en extrema pobreza"

pobreza01 <- read_csv(file = 'data/pobreza_extrema.csv')
head(pobreza01) 
pobreza02 <- read.csv(file = 'data/pobreza_extrema.csv', sep =';', header = T) #se usa para separar el dataframe en tabla
head(pobreza02)

#0 en la columna incidencia
head(pobreza02[pobreza02$Incidencia == 0 , "DISTRITO"])
# los olivos nivel extremo de pobreza
dim(pobreza02)
apply(pobreza02,2, max, na.rm=T)
pobreza02[pobreza02$DISTRITO == "Los Olivos", "Incidencia"]
is.data.frame(pobreza02)
d<-pobreza02
head(d)

head(d[d$DISTRITO == "Los Olivos",]) #reconoce la fila 
d[1297,5]<- 86.7 #"SE USA PARA CAMBIAR UN VALOR DENTRO DE DATA FRAME"
d
head(d[d$Incidencia == 86.7,]) #RPTA:LOS OLIVOS TIENE UNA INCIDENCIA DE 86.7 DE POBREZA EXTREMA

#Crear un data frame que tenga todos los distritos de la región Ancash e Ica sin población en extrema pobreza



