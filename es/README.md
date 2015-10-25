# Guía de programación para el paquete de R `capm`
#### Oswaldo Santos Baquero
oswaldosant@gmail.com  
última revisión: 25th October 2015
<br><br><br><br>

El propóstio de esta guía es mostrar como implementar el [flujo de trabajo](http://oswaldosantos.github.io/capm) soportado por el `capm`, sin entrar en detalles teóricos o en implicaciones prácticas (esto será foco de artículos académicos y de documentación complementar).  
 
#### Presupuestos para reproduzir esta guía:

* Conocimiento mínimo de R.
* Familiaridad con el uso de las páginas de ajuda de la funciones de R.
* `capm` versión 0.8.0 instalado.
* El área de trabajo actual debe contener los siguientes archivos: 
 * pilot.csv
 * psu.ssu.csv
 * santos.dbf
 * santos.prj
 * santos.shp
 * santos.shx
 * survey.data.csv

Los archivos pueden ser descargados [aquí](https://github.com/oswaldosantos/programming-guide-for-the-capm-r-package) usando el botón "Download ZIP" en la parte inferior derecha.  

No serán usadas todas las funciones del `capm` y de las funciones usadas no serán usadostodos los argumentos. Pro favor consulte las páginas de ayuda de las funciones para ver los detalles.