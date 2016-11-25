################################################################################
################################################################################
####################### Universidad del Rosario ################################
##########  Métodos Computacionales para Políticas Públicas ####################
##### Trabajo Final- Análisis de red: Transporte Aéreo Colombiano###############
####################### Maykol Rodríguez Prieto ################################
################################################################################
################################################################################



# Creación de la Red "g" (datos, agosto 2016), que tiene como nodos 
#los diferentes aeropuertos en Colombia y como links, si existe un vuelo entre dos
#de ellos. La Red g es no direccionada.

#Instalación y carga del paquete "igraph"
install.packages("igraph")
library(igraph)

#Se crean los vectores de lazos

edges1<-c("BOG","MDE", "BOG","CLO", "BOG","CTG", "BOG","BAQ", "BOG","BGA", "BOG","SMR")
edges2<-c("BOG","ADZ", "BOG","PEI", "CTG","MDE", "BOG","CUC", "BOG","MTR", "CLO","MDE") 
edges3<-c("ADZ","CLO", "CLO","CTG", "BAQ","MDE", "ADZ","MDE", "BOG","VUP", "BOG","EYP")
edges4<-c("BOG","AXM", "MDE","SMR", "EOH","UIB", "BOG","NVA", "CLO","BAQ", "BOG","PSO")
edges5<-c("APO","EOH", "BOG","MZL", "BOG","LET", "CTG","PEI", "CLO","SMR", "BOG","EOH")
edges6<-c("ADZ","CTG", "BOG","EJA", "BOG","PPN", "BOG","RCH", "EOH","MTR", "EOH","PEI")
edges7<-c("CTG","BGA", "BOG","IBE", "BOG","UIB", "CLO","TCO", "BOG","FLA", "ADZ","PEI")
edges8<-c("ADZ","PVA", "CUC","BGA", "BOG","AUC", "BOG","VVC", "CLO","PSO", "CAQ","EOH")
edges9<-c("ADZ","BGA", "BOG","CZU")

#Se concatenan los lazos

edges<-c(edges1, edges2, edges3, edges4, edges5, edges6, edges7, edges8, edges9)
edges
#Se crea la red "g" la cual es no direccionada
g<-graph(edges,  directed=FALSE)
g
#Número de nodos y lazos de la red "g"
length(V(g))
length(E(g))
#Se le da caracteristicas a los vertices, tamaño y color
V(g)$color<-"skyblue"
E(g)$color<-"red"
#Se grafica la red
X11()
plot(g)

# Creación de la Red h (datos, agosto 2006), que tiene como nodos 
#los diferentes aeropuertos en Colombia y como links, si existe un vuelo entre dos
#de ellos. La Red h es no direccionada.

edgesh1<-c("BOG","MDE", "BOG","CLO", "BOG","CTG", "BOG","BAQ", "BOG","BGA")
edgesh2<-c("BOG","SMR", "BOG","PEI", "BOG","ADZ", "BOG","CUC", "BOG","EOH")
edgesh3<-c("ADZ","CLO", "CLO","MDE", "BOG","MTR", "BOG","MZL", "BOG","NVA")
edgesh4<-c("BOG","PSO", "BOG","AXM", "APO","EOH", "CTG","MDE", "BOG","EYP")
edgesh5<-c("CLO","CTG", "BOG","VUP", "BOG","IBE", "EOH","UIB", "BOG","LET")
edgesh6<-c("BAQ","MDE", "ADZ","MDE", "BOG","AUC", "EOH","PEI", "EOH","MTR")
edgesh7<-c("CLO","BAQ", "BOG","PPN", "CUC","BGA", "CLO","PSO", "CAQ","EOH")
edgesh8<-c("MDE","SMR", "BOG","FLA", "BOG","VVC", "ADZ","PVA")
edgesh<-c(edgesh1, edgesh2, edgesh3, edgesh4, edgesh5, edgesh6, edgesh7, edgesh8)
#red "h"
h<-graph(edgesh,  directed=FALSE)
h
length(V(h))
length(E(h))
#Cantidad de nodos y lazos de "h"
V(h)$color<-"red"
E(h)$color<-"skyblue"
X11()
plot(h)

#### Características de la Red g ########
#A continuación se analizarán las principales caracaterísticas
#de la teoría de redes:

#Average Shortest Path (g)

#Esta medida indica en este análisis, que al escoger un origen-destino aleatorio
#el número de nodos(aeropuertos) que se debe visitar para llegar al destino final

average.path.length(g, directed=FALSE)

#Degree Distribution



hist(degree(g), col="lightblue", xlim=c(0, 50),  xlab="Vertex Degree", ylab="Frequency", main="")

#Degree Distribution (Power Law) (g)

deg.distr<-degree.distribution(g,cumulative=T,mode="all")
deg.distr
all.deg.testgraph<-degree(g,v=V(g),mode="all")
power<-power.law.fit(all.deg.testgraph)
power
#Grafica de degree distribution 
X11()
plot(deg.distr,log="xy", ylim=c(.01,10), bg="blue",pch=21, xlab="Degree",ylab="Cumulative Frequency")
#lines(1:20,10*(1:20)^((-power$alpha)+1))

#Assortative Coefficient(g)

#Esta medida indica si nodos con características similares(grado) se conectan con 
#otros nodos similares o por el contrario se conectan con nodos disimiles.

assortativity_degree(g, directed = FALSE)


#Clustering (g)

#Con esta medida se quiere ver si los vecinos de un nodo también están conectados en
#entre si

transitivity(g)


#Medidas de Centralidad:

#Se tendrán en cuenta dos medidas: Degree Centrality y Betweenness Centrality

#Degree centrality

#Muestra cuales nodos tienen altas conexiones dentro de la red

#Con el siguiente código la red se transforma en su matriz de adjacencia
A <- get.adjacency(g, sparse=FALSE)
install.packages("network")
library(network)
gr<- network::as.network.matrix(A)
install.packages("sna")
library(sna)

#Se grafica con respecto a que nodos tienen alta conexión

X11()
sna::gplot.target(gr, degree(gr), main="Degree", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")


#Betweenness Centrality

#Esta medida cuantifica el número de veces que un nodo hace de puente
#a lo largo del camino más corto entre otros dos nodos

#Para conocer los tres links que tienen mayor betweenness centrality se ejecuta
eb <- edge.betweenness(g)
E(g)[order(eb, decreasing=T)[1:3]]

#se grafica con respecto a nodos con alta intermediación. 

X11()
sna::gplot.target(gr, betweenness(gr), main="Betweenness", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")

#Diamentro

#El diametro en una red es la mayor distancia de entre todos
#los nodos pares de la misma.

#Para hallar el diametro de la red se ejuta el siguiente comando
diameter(g)

#Para identificar los nodos del diametro de la red, se tiene:

nodes.diameter_g<-get.diameter(g)
nodes.diameter_g

#Para visualizar el diámetro en la red "g" se tiene lo siguiente:
#Caracterizamos el color de todos los vértices de la red "g"
V(g)$color<-"skyblue"
#Definimos el tamaño de los vértices
V(g)$size<-7
#Se caracterizas aquellos nodos que componen el mayor diámetro
V(g)[nodes.diameter_g]$color<-"darkgreen"
V(g)[nodes.diameter_g]$size<-10
V(g)[nodes.diameter_g]$label.color<-"black"
#Lo mismo con los links, caracterizamos los pertenecientes al diámetro
E(g)$color<-"grey"
E(g,path=nodes.diameter_g)$color<-"darkgreen"
E(g,path=nodes.diameter_g)$width<-2
#graficamos de nuevo "g" con estas modificaciones
par(mar=c(.1,.1,.1,.1))
x11()
plot.igraph(g, layout=layout.fruchterman.reingold, vertex.label.cex=.5,edge.arrow.size=.5)


#Connectivity

#Una red se dice que conectado si cada vértice es accesible desde 
#todos los demás, es decir, si para cualquier dos vértices,
#existe un lazo entre los dos


#Transformamos la red "g" en su matriz de adjacencia
A <- get.adjacency(g, sparse=FALSE)
#Se quiere saber si "g" es conectada
is.connected(A)

#Partición de la red (g)

#La idea es particionar la red en subconjuntos lo mas disjuntos posibles
#tal que la union de todos estos den la red como resultado.Esta partición
#crea subconjuntos de vértices que tienen una cohesión con 
#respeto a los patrones relacionales

#Se obtiene la siguiente partición para la red "g"

#Se obtienen los subconjuntos de vértices
part_g <- fastgreedy.community(g)
part_g
#El tamaño de la partición, es decir cuantos subconjuntos se tiene
length(part_g)
#Cuantos vértices tiene cada subconjunto
sizes(part_g)
#los miembro de cada subconjunto
membership(part_g)
#Grafica de la partición de g
x11()
plot(part_g, g)

#Caracteristicas para la red "h" la cual tiene los datos de origen-destino
#para agosto del 2006

#average path length (h)
average.path.length(h, directed=FALSE)

#Degree Distribution (Power Law) (h)

deg.distr<-degree.distribution(h,cumulative=T,mode="all")
deg.distr
all.deg.testgraph<-degree(h,v=V(h),mode="all")
power<-power.law.fit(all.deg.testgraph)
power
#Grafica degree distribution(h) 
X11()
plot(deg.distr,log="xy", ylim=c(.01,10), bg="blue",pch=21, xlab="Degree",ylab="Cumulative Frequency")

#Assortative Coefficient (h)
assortativity_degree(h, directed = FALSE)

#Clustering(h)

transitivity(h)

#Degree centrality (h)

#Con el siguiente código la red se transforma en su matriz de adjacencia
A1 <- get.adjacency(h, sparse=FALSE)
#install.packages("network")
#library(network)
gr1<- network::as.network.matrix(A1)
#install.packages("sna")
#library(sna)

#Se grafica con respecto a que nodos tienen alta conexión

X11()
sna::gplot.target(gr1, degree(gr1), main="Degree", circ.lab = FALSE, circ.col="red", usearrows = FALSE, vertex.col=c("yellow", rep("skyblue", 32), "yellow"), edge.col="darkgray")


#Betweenness Centrality(h)

#Para conocer los tres links que tienen mayor betweenness centrality se ejecuta
eb1 <- edge.betweenness(h)
E(h)[order(eb1, decreasing=T)[1:3]]

#se grafica con respecto a nodos con alta intermediación. 

X11()
sna::gplot.target(gr1, betweenness(gr1), main="Betweenness h", circ.lab = FALSE, circ.col="red", usearrows = FALSE, vertex.col=c("yellow", rep("skyblue", 32), "yellow"), edge.col="darkgray")

#Diametro(h)

diameter(h)

#Para identificar los nodos que componen el diametro de la red, se tiene:

nodes.diameter_h<-get.diameter(h)
nodes.diameter_h

#Para visualizar el diámetro en la red "g" se tiene lo siguiente:
#Caracterizamos el color de todos los vértices de la red "g"
V(h)$color<-"skyblue"
#Definimos el tamaño de los vértices
V(h)$size<-7
#Se caracterizas aquellos nodos que componen el mayor diámetro
V(h)[nodes.diameter_h]$color<-"orange"
V(h)[nodes.diameter_h]$size<-10
V(h)[nodes.diameter_h]$label.color<-"black"
#Lo mismo con los links, caracterizamos los pertenecientes al diámetro
E(h)$color<-"grey"
E(h,path=nodes.diameter_h)$color<-"orange"
E(h,path=nodes.diameter_h)$width<-2
#graficamos de nuevo "g" con estas modificaciones
par(mar=c(.1,.1,.1,.1))
x11()
plot.igraph(h, layout=layout.fruchterman.reingold, vertex.label.cex=.5,edge.arrow.size=.5)

#Connectivity(h)

is.connected(A1)

#Partición de la red h

part_h <- fastgreedy.community(h)
part_h
#El tamaño de la partición, es decir cuantos subconjuntos se tiene
length(part_h)
#Cuantos vértices tiene cada subconjunto
sizes(part_h)
#los miembro de cada subconjunto
membership(part_h)
#Grafica de la partición de g
x11()
plot(part_h, h)
