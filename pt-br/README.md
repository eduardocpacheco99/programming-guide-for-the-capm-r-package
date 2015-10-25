# Guia de programação para o pacote do R `capm`
#### Oswaldo Santos Baquero
oswaldosant@gmail.com  
Última revisão: 25 de outubro de 2015
<br><br><br><br>

O propósito deste guia é mostrar como implementar o [fluxo de trabalho](http://oswaldosantos.github.io/capm) suportado pelo `capm`, sem entrar em detalhes teóricos ou em implicações práticas (isto seŕa o foco de artígos academicos e documentação complementar).  
 
#### Pressupostos para reproduzir este guia:

* Conhecimento mínimo de programação no R.
* Familiaridade com o formato das páginas de ajuda das funções.
* `capm` versão 0.8.0 instalada.
* A área de trabalho atual deve conter os seguintes arquivos: 
 * pilot.csv
 * psu.ssu.csv
 * santos.dbf
 * santos.prj
 * santos.shp
 * santos.shx
 * survey.data.csv

Esses arquivos podem ser baixados [aqui](https://github.com/oswaldosantos/programming-guide-for-the-capm-r-package) usando o botão "Download ZIP" no canto inferior direito.  

Não usaremos todas as funções do `capm` e das funções usadas só exploraremos alguns argumentos. Pro favor consulte as páginas de ajuda das funções para ver os detalhes.