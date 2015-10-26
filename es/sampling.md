



## Calculando el tamaño muestral

Continuando con el diseño por conglomerados en dos etapas, hay dos fuentes de datos que necesitamos para calcular el tamaño y la composición muestral. La primera es el objeto `psu.ssu` que creamos en la primera sección. La segunda fuente contiene datos que colectamos hipotéticamente en la muestra piloto que diseñamos anteriormente. El archivo `pilot.csv` contiene tantas filas como residencias visitadas en el piloto. La primera columna contiene los identificadores de la UPM a la que pertenece la respectiva residencia. La segunda columna contiene el número de perros observados en cada residencia. Con estas dos fuentes de datos, podemos definir el nivel de confianza que queremos, el error que estmos dispuestos a aceptar y una estimativa de costo. La última es la razón entre el costo asociado a la visita de una UPM y el costo asociado a la realización de una entrevista.  


```
                                               Value
Sample size                             3.000000e+02
Number of PSU to be sampled             2.000000e+01
Number of SSU to be sampled in each psu 1.500000e+01
Intercluster variance                   1.878684e+04
Intracluster variance                   9.066137e-01
Intraclass correlation coefficient      2.945012e-01
```

Una vez definidos el tamaño y la composición de la muestra final, la selección de las unidades de muestreo es una questión de repetir lo que hicimos en las dos primeras secciones, usando los resultados previos (20 UPM y 15 USM por UPM). Recordemos que 2.000000e+01 = 20 y 1.500000e+01 = 15.


```r
> final.psu <- SamplePPS(psu.ssu, 20, write = F)
> final.ssu <- SampleSystematic(final.psu, 15,
+                               write = F)
> MapkmlPSU(shape = 'santos',
+           psu = final.psu[, 1], id = 1)
```



