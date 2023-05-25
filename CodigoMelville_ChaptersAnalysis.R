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

chapter.freqs.t
chapter.freqs.l[[1]]["whale"]
chapter.freqs.l[[2]]["whale"]

whale.l <- lapply(chapter.freqs.l,'[','whale')
whale.l

whale.m <- do.call(rbind,whale.l)
whale.m
dim(whale.m)

ahab.l<- lapply(chapter.freqs.l,'[','ahab')
ahab.m <- do.call(rbind,ahab.l)
ahab.m 

whale.v <- whale.m[,1]
ahab.v <- ahab.m[,1]
whale.v
ahab.v 

whale.ahab.m <- cbind(whale.m, ahab.m)
dim(whale.ahab.m)
whale.ahab.m

colnames(whale.ahab.m) <- c("whale", "ahab")
whale.ahab.m

barplot(whale.ahab.m, main = "Bar plot whale y ahab", beside = TRUE, col = c("darkgrey", "darkblue"))
