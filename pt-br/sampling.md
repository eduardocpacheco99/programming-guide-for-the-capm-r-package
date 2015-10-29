



## Calculando o tamanho amostral

Continuando com o desenho por conglomerados em dois estágios, há duas fontes de dados que precisamos para calcular o tamanho e a composição amostral. A primeira é o objeto `psu.ssu` que criamos na primeira seção. A segunda fonte contém dados que coletamos hipoteticamente na amostra piloto que desenhamos anteriormente. O arquivo `pilot.csv` contém tantas linhas como domicílios visitados no piloto. A primeira coluna contém os identificadores das UPA à que pertence o respectivo domicílio. A segunda coluna contém o número de cães observados em cada domicílio. Com essas duas fontes de dados, podemos definir o nível de confiança que queremos, o erro que estamos dispostos a aceitar e uma estimativa do custo. A última é a razão entre o custo associado à visita de uma UPA e o custo associado à realização de uma entrevista.  


```
                                               Value
Sample size                             3.000000e+02
Number of PSU to be sampled             2.000000e+01
Number of SSU to be sampled in each psu 1.500000e+01
Intercluster variance                   1.878684e+04
Intracluster variance                   9.066137e-01
Intraclass correlation coefficient      2.945012e-01
```

Uma vez definidos o tamanho e a composição da amostra final, a seleção das unidades amostrais é uma questão de repetir o que fizemos nas duas primeiras seções, usando os resultados prévios (20 UPA e 15 USA por UPA). Lembremos que 2.000000e+01 = 20 e 1.500000e+01 = 15.


```r
> final.psu <- SamplePPS(psu.ssu, 20, write = F)
> final.ssu <- SampleSystematic(final.psu, 15,
+                               write = F)
> MapkmlPSU(shape = 'santos',
+           psu = final.psu[, 1], id = 1)
```



