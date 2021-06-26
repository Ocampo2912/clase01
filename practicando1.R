a = "Hello"
print(a)
##Asignación de objetos
obj <- c(5, 2, 6, 58, 456, 56, 5)
obj
c(5, 2, 6, 58, 456, 56, 5) -> obj
obj

##VECTOR 
#Es el lemento más básico en R.
#Contiene elementos de la misma clase (son atómicos).
#Se crea con la función c(), que significa ‘concatenar’ o ‘combinar’.

vector01 <- c(1,2,4,7,10,11,12,19,26)
vector01

vector02 <- c("a", "b", "d", "g", "j", "k", "l", "s", "z")
vector02

vector03 <- c("jorge", "roy", "daniel", "cesar", "patin", 254, 265)
vector03

vector04 <- c(FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
vector04

#indexar vectores
#la numeracion empieza desde el 1 en R
vector01
vector01[4]

#evaluar la naturaleza del vector 

a<- vector01[4]
is.vector(a)
is.numeric(a)
is.integer(a)

v<-c(0,0,1,1)
is.vector(v)
is.numeric(v)
is.integer(v)
is.logical(v)



#operaciones con vectores

length(vector01)
(vector01*2) + 500

sum(vector01)

sqrt(vector01)
vector01 + (vector01 * 2)

#secuencias númericas 
# x:y puede leerse como "secuencia de x a(:) y"
1:20
pi:10
15:1

# seq(x,y,by,length) puede leerse como “secuencia de x a(:) y” con
# "by" incrementos o "length" de elementos
seq(0, 21)

seq(0,21, by = 3)
seq(0,21,length = 20)

###FACTOR

#Solo hay doce meses posibles y no hay nada que te resguarde de errores de tipeo:
vect01 <- c("Dec", "Apr", "Jan", "Mar", "Jan", "Mar")

#No se ordena de una forma útil:

sort(vect01)

#Puedes solucionar ambos problemas con un factor. Para 
#crearlo, debes empezar definiendo una lista con los niveles válidos:


month_levels <- month.abb

#Ahora puedes crear un factor:

factor01 <- factor(vect01, levels = month_levels)
factor01

sort(factor01)

#Cualquier valor no fijado en el conjunto será convertido a 
#NA de forma silenciosa:
vect02 <- c("Dec", "Apr", "Jam", "Mar", "Jan", "Mar")
factor02 <- factor(vect02, levels = month_levels)
factor02

#Si quieres una advertencia, puedes usar readr::parse_factor() 
#(segmentar un factor, en inglés):

readr::parse_factor(vect02, levels = month_levels)

#Si omites los niveles, se van a definir a partir de 
#los datos en orden alfabético:

factor(vect01)

factor(vect01, levels = unique(vect01))
forcats::fct_inorder(factor(vect01))

factor011 <-factor(c("Dic","Aug","Jun"))
sort(factor011)


is.integer(c(1,2,5L))

vector0222 <-c(5,1,8,5,78,2.5)
vector0222(c[2:4,6])

seq(1:10)























