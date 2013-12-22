library(ggplot2)    
require(RCurl)

link<-getURL("https://dl.dropbox.com/s/ds5zp9jonznpuwb/dat.txt")
datos<- read.csv(textConnection(link),header=TRUE,sep=";")
datos$fecha <- as.POSIXct(datos[,1], format="%d/%m/%Y")    

temp = ggplot(data=datos,aes(x=fecha, y=TempMax,colour="1")) + 
           geom_line(colour="red") + opts(title="TITULO") +
           ylab("Temperatura (C)") + xlab(" ") + 
           scale_y_continuous(limits = c(-10,40)) + 
           geom_line(aes(x=fecha, y=TempMedia,colour="2"),colour="green") + 
           geom_line(aes(x=fecha, y=TempMin,colour="2"),colour="blue") +
           scale_colour_manual(values=c("red","green","blue"))

temp
