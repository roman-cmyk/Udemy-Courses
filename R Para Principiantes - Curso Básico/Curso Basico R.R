# ---
# title: "Course : R Fundamentals - Udemy"
# author: "Francisco Roman Peña de la Rosa"
# date: "30/5/2020"
# output: Script file
# ---

library(ggplot2)

iris <- iris
head(iris, 5)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

write.table(datos, 'datos_nuevos.csv', quote = FALSE, sep = ';',
            row.names =  FALSE)

datos <- read.table('datos.csv', sep = ',' , header = 'TRUE')


#***---- Tipos de Datos - Vectores
vector1 <- c(1, 3, 4)
vector2 <- c(5, 8, 9)
vector3 <- vector1 + vector2
vector3

#***---- Matrices
mymatrix <- matrix(1:9, nrow = 3, ncol = 3)
mymatrix
mymatrix[1,2]
mymatrix[2,3]
mymatrix*2

#***---- Listas
mylist <- list(vector1, vector2, mymatrix)
mylist
mylist[2]
mylist[3]
mylist[1]


#***---- Conversión de Objetos
as.data.frame(mymatrix)
as.list(mymatrix)
as.vector(mymatrix)
as.array(mymatrix)


#***---- Seleccionando Datos [] y subset()

# Seleccionar datos con []
iris
iris['Sepal.Length']
iris[1:10, 1:2]
iris[c(2, 4, 6), 1:2]

# Seleccionar datos con subset()

subset1 <- subset(iris, iris$Sepal.Length > 5)
subset1
head(subset1, 5)
subset2 <- subset(iris, iris$Species == 'setosa')
subset2
head(subset2, 5)


#***---- Funciones
MiFuncion1 <- function(x, y, numero, veces){
  z <- x + y
  
  for (i in 1:veces) {
    z <- z + numero
  }
  return(z)
}

MiFuncion1(1, 2, 1, 3)
MiFuncion1(1, 2, 1, 4000)

HorasASegundos <- function(hora){
  h <- hora*3600
  return (h)
}

HorasASegundos(5)


#***---- Bucles o Loops

# While

i <- 1

while (i <= 5) {
  
  print(i)
  i <-  i + 1
}

# Repeat

repeat{
  if (i <= 10){
    print(i)
    i <- i +1
  }
  else {
    break();
  }
}

# For

años <- c(2015, 2016, 2017, 2018, 2019, 2020)

for (i in años) {
  print(paste0(" ¡Estamos en ", i, "!"))
  
}


#***---- Ejercicio While
# Inicializa la velocidad
velocidad <- 150
# Escribe el bucle while
while (velocidad > 120) {
  
  print("¡Reduce la Velocidad!")
  velocidad <- velocidad - 1
  
  print(paste0("vas a ", velocidad, "."))
}


#***---- For Loop - Ejercicio Prático
ciudades <- c('Barcelona', 'Madrid', 'Valencia', 'Sevilla')

for (ciudad in ciudades) {
  if(nchar(ciudad) > 6){
    print(ciudad)
  }
}

# For Indexando

for (i in 1:length(ciudades)){
  if(nchar(ciudades[i]) > 6){
    print(ciudades[i])
  }
}


#***---- Gráficos Básicos Usando Plot
ventas <- c(1, 3, 5, 7, 9, 11, 23)
visitas <- c(3, 6, 10, 20, 17, 28)

plot(visitas, type = 'l', col = 'blue')

barplot(ventas)

hist(ventas)

hist(visitas)

pie(visitas, col = rainbow(length(ventas)), labels = c('lunes', 'martes'))


#***---- Gr�ficos Avanzados Utilizando ggplot2
library(ggplot2)
iris

ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
  geom_point()

p <- ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species))

a <- p + geom_point(aes(shape = Species))

b <- a + xlab('Sepal Length') + ylab('Sepal Width') + ggtitle('Sepal Length And Sepal Width')
c <- b + geom_smooth(method = 'lm')

c + facet_grid(Species ~ . )


head(ChickWeight,5)
uno <- subset(ChickWeight, ChickWeight$Chick == 1)

ggplot(data = ChickWeight, aes(x = Time , y = weight, group =Chick, colour = Diet)) +
  geom_line() + ggtitle('Crecimiento de Pollos por Dieta')

            