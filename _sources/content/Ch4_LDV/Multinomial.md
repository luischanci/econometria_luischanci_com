# Modelos de Elección Múltiple 

## Introducción

Consideramos ahora una generalización o extensión de los modelos Logit/Probit. Pasaremos de una variable dependiente que permite dos opciones (binaria) a más de dos opciones. Primero estudiaremos el caso en el cual las opciones no asocian un orden particular. Es decir, modelo de **múltiples respuestas no ordenadas**, también conocido como regresión logística multinomial o _Multinomial Logit_. Por ejemplo, preguntarles a las personas cuál de los tres medios de transporte usa (metro, bus, bicicleta) o cuál es el plan de salud que elige entre varias opciones. Luego revisaremos el modelo de **respuestas ordenadas**, también conocido como Logit/Probit Ordenado. Por ejemplo, evaluar la calidad de un servicio seleccionando entre una de las tres opciones "excelente, bueno, malo", involucra un ordenamiento implicito de las alternativas.

Al igual que el caso del Logit/Probit, la aproximación teórica parte por asociar funciones de probabilidad a las elecciones u opciones, y por ende la técnica que emplearemos para obtener los parámetros estimados es el {ref}`Ch_MLE`. Es decir, el ejercicio se centrará en plantear la función de verosimilitud.

Referencia: Esta subsección sigue de cerca el capítulo 15 de {cite:t}`cameron2005`.

## Multinomial Logit

Es un modelo en donde la variable dependiente posee más de dos aalternativas cualitativas y las alternativas no implican un orden. Por ejemplo, eegir un lugar para pescar: $y_i\in\{playa,bote,muelle\}$. 

El planteamiento inicial es similar a lo visto en el modelo de utilidad aleatoria: se seleccionará una opción sobre otra  en base a la utilidad.

Sean $J+1$ opciones, la probabilidad 

$$Pr(Y=j|\boldsymbol{X})=\frac{exp(X\beta^{(j)})}{\left[1+\sum_{j=1}^J{exp(X\beta^{(j)})}\right]}\hspace{0.1cm},\hspace{0.5cm}j=1,...,J$$

$$Pr(Y=0|\boldsymbol{X})=\frac{1}{\left[1+\sum_{j=1}^J{exp(X\beta^{(j)})}\right]}\hspace{0.1cm},\hspace{0.5cm}j=1,...,J$$

.

.

.

</br>

## Logit Condicional

</br>

## Logit/Probit Ordenado



.

.

.



</br>
<center><figure>
    <img alt="../../_images/under_construction.jpg" src="../../_images/under_construction.jpg" width="30%" height="30%"style="margin: 15px 0 0 0">
    <figcaption>(Digitalización de apuntes en progreso) </figcaption>
</figure></center>
</br>

<hr>
