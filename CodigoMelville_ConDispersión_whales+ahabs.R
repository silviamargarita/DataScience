#Mirar cual es el folder de trabajo actual y asegurarse que en el esté el documento de la obra
getwd()

#Lee el texto desde el archivo "melville.txt" y lo coloca en un vector
text.v <- scan("data/plainText/melville.txt", what="character", sep="\n")

#Imprime el texto desde el archivo que ha sido colocado en el vector text.v  
text.v

# Imprime la primera y segunda línea del vector text.v
text.v [1]
text.v [2]

# Guarda lalínea del texto en donde inicia la obra en start.v
start.v <- which(text.v == "CHAPTER 1. Loomings.")
start.v

# Guarda lalínea del texto en donde finaliza la obra en start.v
end.v <- which(text.v == "orphan.")
end.v

# Las siguientes líneas guardan en variables el texto del metadato de la obra
# El metadato tiene dos partes, una al principio de la obra y una al final
# El metadato del principio de la obra inicia en la línea 1 y finaliza en la línea anterior a que comience la obra (start.v -1)

start.metadata.v <- text.v[1:start.v -1]
start.metadata.v

# El metadato del final de la obra inicia en la línea (end.v+1) y finaliza en la última de la obra
end.metadata.v <- text.v[(end.v+1):length(text.v)]
end.metadata.v

# Colocamos todo el metadato de la obra en la variable (metadata.v)
metadata.v <- c(start.metadata.v, end.metadata.v)
metadata.v

# Ahora, las lineas de la novela son las que se encuentra entre la línea de inicio (start.v) y la de fin de la obra (end.v)
# Colocaremos estás líneas en la variable (novel.lines.v)
novel.lines.v <-  text.v[start.v:end.v]
novel.lines.v

class(novel.lines.v)

# La variable novel.lines.v almacena en líneas la novela, con la función paste se uniran todas las líneas de la novela, separandolas con un espacio " "
novel.v <- paste(novel.lines.v, collapse=" ")
novel.v

class(novel.v)

# La funcion tolower transforma el texto en minúscula
novel.lower.v <- tolower(novel.v)
novel.lower.v

#strsplit divide la novela en palabras, esta función genera una lista que es un tipo de dato en R
moby.words.l <- strsplit(novel.lower.v, "\\W")
moby.words.l

class(moby.words.l)

#la función unlist transforma la lista en vector, esto es necesario porque hay funciones que aplican a ciertos tipos de datos en R
moby.word.v <- unlist(moby.words.l)
moby.word.v
class(moby.word.v)

#Las siguientes líneas permitiran eliminar los caracteres blancos ""
#Se identifica donde están los espacios diferentes a espacios en blanco
not.blanks.v  <-  which(moby.word.v!="")
not.blanks.v

#La obra sera ahora todas las palabras diferentes a los espacios en blanco
moby.word.v <-  moby.word.v[not.blanks.v]
moby.word.v

#Ahora identificaremos las veces que aparece la palabra "whale" en la obra
whales.v <- which(moby.word.v=="whale")
whale.hits.v <- length(moby.word.v[which(moby.word.v=="whale")])
whale.hits.v

#Calculamos el número total de palabras en la obra
total.words.v <- length(moby.word.v)
total.words.v

#Calculamos la proporción de la palabra whale con respecto al número total de palabras en la obra
whale.hits.v/total.words.v

#La función table calcula la frecuencia de cada palabra
moby.freqs.t <- table(moby.word.v)
moby.freqs.t

#La función sort ordena decrecientemente la frecuencia de la palabra
sorted.moby.freqs.t <- sort(moby.freqs.t , decreasing=T)

#Se imprimer la lista de frecuencia
sorted.moby.freqs.t[1:20]

#Se visualizan las 20 palabras con mayor frecuencia
plot(sorted.moby.freqs.t[1:20],main = "Palabras más frecuentes")

#Vamos a colocar el termino NA en cada palabra de la novela
w.count.v<-rep(NA,length(moby.word.v))
length(w.count.v)
w.count.v

#Vamos a colocar el número -1 cada vez que aparezca la palabra whale en el texto
w.count.v[whales.v]<-1
w.count.v

#Dibujamos el gráfico de dispersión de la palabra whale en la novela
plot(w.count.v, main = "Dispersion", xlab = "Novel time", ylab = "whale", type = "h", ylim=c(1,0), yaxt = "n")

ahab.v <- which(moby.word.v=="ahab")
ahab.hits.v <- length(moby.word.v[which(moby.word.v=="ahab")])
ahab.hits.v/total.words.v

a.count.v <- rep(NA,length(moby.word.v))
a.count.v[ahab.v]<-1
plot(a.count.v, main = "Dispersion", xlab = "Novel time", ylab = "ahab", type = "h", ylim=c(1,0), yaxt = "n")


whales.ahabs.m <-cbind(whales.v, ahab.v)
dim(whales.ahabs.m)
whales.ahabs.m
colnames(whales.ahabs.m)<-c("whale","ahab")
barplot(whales.ahabs.m, beside = T, col="grey")
