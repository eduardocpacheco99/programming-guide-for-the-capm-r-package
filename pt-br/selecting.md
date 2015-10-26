

Com o pacote `capm` é possível implementar os siguientes desenhos amostrais:  
* Amostragem aleatória sistemática  
* Amostragem aleatória estratificada  
* Amostragem aleatória complexa  (disenhos por conglomerados em dois estágios com selecção probabilítstica proporcional ao tamanho)

Implementemos un desenho por conglomerados en dois estágio que é o mais desafiante mas tambiem o mais apropriado para algumas situações (cidades grandes). O arquivo `psu.ssu.csv` contém dados da cidade de Santos, Brasil. Os dados foram obtidos no Instituto Brasileiro de Geografia e Estatística ([IBGE](http://ibge.gov.br)). A primeira colmna tem identificadores únicos dos setores censitários, a nossas Unidades Primárias de Amostragem (UPA). A segunda coluna contém o número de residências eM cada UPA. As residencias as nossas Unidades Secundárias de Amostragem (USA), que ao mesmo tempo são a medida do tamanho das UPA.


Carreguemos o paquete e importemos el arquivo.


```r
> library(capm)
> psu.ssu <- read.csv(file = 'psu.ssu.csv')
```

Podemos ver que há 652 UPA e as seis primerias linhas nós dão uma ideia dos dados.


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

Todas as UPA são aparentemente iguais devido à notação científica. Os identificadores devem ser únicos para cada UPA e para verificar esse requerimento, podemos mudar a forma de impressão ou verificar que o número de diferentes identificadores é igual ao número de UPA.


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

O arquivo contém exactamente a información que precisamos para amostrar UPA com probabilidad proporcional ao tamaño (PPT) e com resposição. Se o argumento `write` de `SamplePPS` é definidio como `TRUE`, as UPA selecionadas serão salvas em um arquivo "csv" que pode ser visto em um software de folhas de cálculo. O resultado terá tantas linhas como UPA selecionadas. Lembremos que uma UPA pode ser seleccionada mais de uma vez porque a amostragem é com resposição.  

Se usamos `set.seed(algun_numero)`, a seguiente pseudo amostra será sempre a mesma. Neste gua usaremos `set.seed(4)` para que todos podamos reproduzir exatamente todos os exemplos. Não entanto, em aplicaciones reaies no devemos usar `set.seed`.


```r
> set.seed(4)
> pilot.psu <- SamplePPS(psu.ssu = psu.ssu,
+                        psu = 10,
+                        write = FALSE)
```

Ao inspeccionar o objeto que acabamos de criar podemos ver que a "clase" dos identificadores das UPA foi convertida para `character`. Isto quer dizer que os identificadores agora são representados como texto, no como números.


```r
> str(pilot.psu)
```

```
'data.frame':	10 obs. of  2 variables:
 $ selected.psu: chr  "354850005000377" "354850005000012" "354850005000195" "354850005000185" ...
 $ size        : int  210 409 288 224 227 243 77 262 475 247
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

A seleção das USA é tão simples como a selecção anterior. O resultado terá tantas linhas como USA selecionadas em cada UPA e tantas colunas como UPA selecionadas.


```r
> set.seed(4)
> pilot.ssu <- SampleSystematic(
+     psu.ssu = pilot.psu,
+     su = 5, write = FALSE)
```

Vejamos as primeiras dos colunas para ter uma ideia.


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
