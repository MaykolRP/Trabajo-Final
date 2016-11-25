# Un Análisis de red al transporte aéreo colombiano
[Maykol Rodríguez Prieto]
Noviembre, 2016

<img src="network_ex.jpg">

##Descripción y Motivación
El transporte aéreo juega un papel fundamental en la economía del país, por esta razón el presente trabajo tiene como objetivo analizar la red de transporte aéreo colombiana, de esta forma entender sus principales características. 
Se medirán las principales propiedades propias de una red, como lo son: 

•	average shortest path

•	 degree distribution

•	 assortative mixing

•	clustering

•	betweenness centrality

•	Partición de la red


Adicional a estas propiedades se hará una comparación entre la red que toma datos de las diferentes rutas entre aeropuertos colombianos en agosto del 2016 y la red con datos en agosto del 2006. Con esto, se busca observar la evolución del transporte aéreo colombiano durante una década.
Para el presente análisis los nodos de la red son los distintos aeropuertos ubicados en las ciudades colombianas y una conexión es simplemente la existencia de un vuelo entre dos de ellos, para este caso la red se tomará no direccionada, teniendo en cuenta que en todos los casos si existe un vuelo de ida, existe vuelo de regreso.

##Método Utilizado
Para analizar la red de transporte aéreo colombiana se utilizo lenguaje de programación R, específicamente el paquete "iGraph". El cual permite tanto crear la red, graficar la red y características intrínsecas de ésta mismas y de igual forma obtener las principales medidas.

1.Para la creación de la red, debemos ingresar las relaciones entre los distintos nodos, para este análisis se realizo, creando vectores de relaciones, paso a seguir concatenar dicha información, y iGraph se encarga de crear la red. Para este análisis se obtuvieron dos redes. La primera, con datos de origen-destino de viajes entre aeropuertos colombianos de agosto del 2016 (Red "g") y la otra red origen-destino de agosto del 2006 (Red "h"). Ambas redes se ingresaron a R como no-direccionada.


