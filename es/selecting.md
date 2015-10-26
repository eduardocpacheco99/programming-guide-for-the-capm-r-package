
```
## Error in options(width == 66): object 'width' not found
```

Con el paquete `capm` es posible implementar los siguientes diseños muestrales:  
* Muestreo aleatorio sistemático  
* Muestreo aleatorio estratificado  
* Muestreo aleatorio complejo  (diseños por conglomerados en dos etapas con selección probabilítstica proporcional al tamaño)

Implementemos un diseño por conglomerados en dos etapas que es el más desafiante pero también el más apropiado para algunas situaciones (ciudades grandes). El archivo `psu.ssu.csv` contiene datos de la ciudade de Santos, Brasil. Los datos fueron obtenidos en el Instituto Brasileiro de Geografia e Estatística ([IBGE](http://ibge.gov.br)). La primera columna tiene identificadores únicos de los sectores censales, nuestras Unidades Primárias de Muestreo (UPM). La segunda columna contiene el número de residencias en cada UPM. Las residencias son nuestras Unidades Secundárias de Muestreo (USM), que al mismo tiempo son la medida de tamaño de las UPM.


Carguemos el paquete e importemos el archivo.


```r
> library(capm)
> psu.ssu <- read.csv(file = 'psu.ssu.csv')
```

Podemos ver que hay 652 UPM y las seis primeras filas nos dan una idea de los datos.


```r
> nrow(psu.ssu); head(psu.ssu)
```

```
[1] 652
```

```
         psu ssu
1 3.5485e+14 119
2 3.5485e+14  43
3 3.5485e+14  79
4 3.5485e+14 129
5 3.5485e+14  53
6 3.5485e+14  46
```

Todas las UPM son aparentemente iguales devido a la notación científica. Los identificadores deben ser únicos para cada UPM y para verificar este requerimiento, podemos cambiar la forma de impresión o verificar que el número de diferentes identificadores es igual al número de UPM.


```r
> print(head(psu.ssu), digits = 15)
```

```
              psu ssu
1 354850005000001 119
2 354850005000002  43
3 354850005000003  79
4 354850005000004 129
5 354850005000007  53
6 354850005000008  46
```

```r
> length(unique(psu.ssu[ , 1]))
```

```
[1] 652
```

El archivo contiene exactamente la información que necesitamos para muestrear UPM con probabilidad proporcional al tamaño (PPT) y con resposición. Si el argumento `write` de `SamplePPS` es definidio como `TRUE`, las UPM seleccionadas serán guardadas en un archivo "csv" que puede ser visto en un software de hojas de cálculo. El resultado tendrá tantas filas como UPM seleccionadas. Recordemos que una UPM puede ser seleccionada más de una vez porque el muestreo es con resposición.  

Si usamos `set.seed(algun_numero)`, la siguiente seudo muestra será siempre la misma. En esta guía usaremos `set.seed(4)` para que todos podamos reproduzir exactamente todos los ejemplos. Sin embargo, en aplicaciones reales no debemos usar `set.seed`.


```r
> set.seed(4)
> pilot.psu <- SamplePPS(psu.ssu = psu.ssu,
+                        psu = 10,
+                        write = FALSE)
```

Al inspeccionar el objeto que acabamos de crear podemos ver que la "clase" de los identificadores de las UPM fue convertida a `character`. Esto quiere decir que los identificadores ahora son representados como texto, no como números.


```r
> str(pilot.psu, vec.len = 1)
```

```
'data.frame':	10 obs. of  2 variables:
 $ selected.psu: chr  "354850005000377" ...
 $ size        : int  210 409 ...
```

```r
> head(pilot.psu)
```

```
     selected.psu size
1 354850005000377  210
2 354850005000012  409
3 354850005000195  288
4 354850005000185  224
5 354850005000524  227
6 354850005000174  243
```

La selección de las USM es tan simple como la selección anterior. El resultado tendrá tantas filas como USM seleccionadas en cada UPM y tantas columnas como UPM seleccionadas.


```r
> set.seed(4)
> pilot.ssu <- SampleSystematic(
+     psu.ssu = pilot.psu,
+     su = 5, write = FALSE)
```

Veamos las primeras dos columnas para tener una idea.


```r
> head(pilot.ssu[ , 1:2])
```

```
     354850005000377 354850005000012
[1,]              25               1
[2,]              67              82
[3,]             109             163
[4,]             151             244
[5,]             193             325
```
