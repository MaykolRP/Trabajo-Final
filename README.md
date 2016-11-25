# Un Análisis de red al transporte aéreo colombiano
[Maykol Rodríguez Prieto]
Noviembre, 2016

<img src="network_ex.jpg">

## Descripción y Motivación
El transporte aéreo juega un papel fundamental en la economía del país, por esta razón el presente trabajo tiene como objetivo analizar la red de transporte aéreo colombiana, de esta forma entender sus principales características. 
Se medirán las principales propiedades propias de una red, como lo son: 

-	average shortest path

-	 degree distribution

- assortative mixing

- clustering

- betweenness centrality

- Partición de la red


Adicional a estas propiedades se hará una comparación entre la red que toma datos de las diferentes rutas entre aeropuertos colombianos en agosto del 2016 y la red con datos en agosto del 2006. Con esto, se busca observar la evolución del transporte aéreo colombiano durante una década.
Para el presente análisis los nodos de la red son los distintos aeropuertos ubicados en las ciudades colombianas y una conexión es simplemente la existencia de un vuelo entre dos de ellos, para este caso la red se tomará no direccionada, teniendo en cuenta que en todos los casos si existe un vuelo de ida, existe vuelo de regreso.

Los datos que determinan la relación entre los distintos nodos(aeropuertos) fueron tomados de la Aeronautica Civil Colombiana, la cual en su página tiene estadísticas mensuales de origen-destino del transporte aéreo en Colombia.

## Método Utilizado
Para analizar la red de transporte aéreo colombiana se utilizo lenguaje de programación R, específicamente el paquete "iGraph". El cual permite tanto crear la red, graficar la red y características intrínsecas de ésta mismas y de igual forma obtener las principales medidas.

1. Para la creación de la red, debemos ingresar las relaciones entre los distintos nodos, para este análisis se realizo, creando vectores de relaciones, paso a seguir concatenar dicha información, y iGraph se encarga de crear la red. Para este análisis se obtuvieron dos redes. La primera, con datos de origen-destino de viajes entre aeropuertos colombianos de agosto del 2016 (Red "g") y la otra red origen-destino de agosto del 2006 (Red "h"). Ambas redes se ingresaron a R como no-direccionada.

2. Para la graficación de la red, se dieron características tanto de color y forma a vertices y nodos, esto con la finalidad de identificar diferentes relaciones dentro de la red como: nodos centrales, diametro y partición de la red.

3. iGraph es bastante detallado en sus códigos para encontrar la información que se requiere de la red y así interpretar la dinámica que esta presenta. Por esta razón medidas como Averahe Shortest Path, Degree Distribution, Clustering, entre otras una vez construida la red, son medidas faciles de obtener.

## Resultados 

- Grafica de la red "g"

<img src="Grafica_g.jpeg">

La red “g” tiene 32 nodos y 50 conexiones entre los nodos.

- Average Shortest Path de la red "g"

Esta característica se define como el promedio en la cantidad de pasos para llegar de un nodo a otro nodo.
Para el grafo g que analiza los datos de agosto de 2016, esta medida es: 2.092742.

De esta forma para la red de transporte aéreo colombiana, si se toma un origen-destino aleatorio un pasajero debería visitar dos aeropuertos para llegar a su destino final.

- Degree Distribution





##Conclusiones




