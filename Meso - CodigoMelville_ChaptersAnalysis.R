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

chap.positions.v <- grep("^CHAPTER \\d", novel.lines.v)
chap.positions.v
novel.lines.v[chap.positions.v]
novel.lines.v<-c(novel.lines.v,"END")
last.position.v<-length(novel.lines.v)
last.position.v
chap.positions.v<-c(chap.positions.v,last.position.v)
chap.positions.v

for (i in 1:length(chap.positions.v)){
  print (chap.positions.v[i])
  
}

for (i in 1:length(chap.positions.v)){
  print(paste("Chapter",i,"comienza en la posición",chap.positions.v[i]),sep = "")
  
}
chapter.raws.l <- list()
chapter.freqs.l<- list()

for (i in 1:length(chap.positions.v)){
  if (i != length(chap.positions.v)){
    chapter.title <- novel.lines.v [chap.positions.v[i]]
    startc <- chap.positions.v[i]+1
    endc <- chap.positions.v[i+1]-1
    chapter.lines.v <- novel.lines.v[startc:endc]
    chapter.words.v <- tolower(paste(chapter.lines.v, collapse = ""))
    chapter.words.l <- strsplit(chapter.words.v, "\\W")
    chapter.word.v <- unlist(chapter.words.l)
    chapter.word.v <- chapter.word.v [which(chapter.word.v!="")]
    chapter.freqs.t<-table(chapter.word.v)
    chapter.raws.l[[chapter.title]]<- chapter.freqs.t
    chapter.freqs.t.rel <- 100*(chapter.freqs.t/sum(chapter.freqs.t))
    chapter.freqs.l[[chapter.title]]<-chapter.freqs.t.rel
  }
  
}

#Frecuencia de palabras por capítulo
chapter.raws.l
length(chapter.raws.l)
names(chapter.raws.l)

class(chapter.raws.l$`CHAPTER 1. Loomings.`)
chapter.raws.l$`CHAPTER 1. Loomings.`

chapter.raws.l[[1]]

#str brinda otros detalles acerca del dato
str(chapter.raws.l)
str(chapter.raws.l[[1]])

#Suma de todas las palabras del capítulo 1
sum(chapter.raws.l[[1]])
length(chapter.raws.l[[1]])

#Calculando el numero de veces que cada palabra es usada en el capítulo 1
sum(chapter.raws.l[[1]])/length(chapter.raws.l[[1]])
mean(chapter.raws.l[[1]])

class(chapter.raws.l)

# --- PROMEDIO DE USO DE LAS PALABRAS ---#
lapply(chapter.raws.l, mean)
mean.word.use.m <- do.call(rbind, lapply(chapter.raws.l, mean))
dim(mean.word.use.m)
class(mean.word.use.m)
plot(mean.word.use.m, type = "h")

# --- NORMALIZAR LOS DATOS ---#
scale(mean.word.use.m)
plot(scale(mean.word.use.m), type = "h")

# --- ORDENAR USO PROMEDIIO DE LAS PALABRAS ---#
order(mean.word.use.m)
order(mean.word.use.m, decreasing = TRUE)
mean.word.use.m[order(mean.word.use.m, decreasing = TRUE),]


# -- TTR --TYPE TOKEN RATIO  ---#
#un porcentaje o ratio de los tipos de palabras únicas sobre el número de palabras 

sum(chapter.raws.l[[1]])/length(chapter.raws.l[[1]])
mean(chapter.raws.l[[1]])

length(chapter.raws.l[[1]])/sum(chapter.raws.l[[1]])*100


ttr.l <- lapply(chapter.raws.l, function(x) {length(x)/sum(x)*100})
ttr.m <- do.call(rbind, ttr.l)
ttr.m [order(ttr.m, decreasing = TRUE),]
plot(ttr.m, type = "h")

