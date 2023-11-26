# Modelos de Elección Múltiple 

## Introducción

Consideramos ahora una generalización o extensión de los modelos Logit/Probit. Específicamente, pasaremos de una variable dependiente que permite dos opciones (binaria) a una categórica que aborda más de dos opciones. 

Primero estudiaremos el caso en el cual las opciones no asocian un orden particular. Es decir, modelo de **múltiples respuestas no ordenadas**, también conocido como regresión logística multinomial o _Multinomial Logit_. Algunos ejemplos son:

- ¿Cuál de los siguientes medios de transporte emplea para ir al trabajo? 
  1. Metro
  2. Bus
  3. Bicicleta

- ¿Por cuál de los siguientes partidos votará en las próximas elecciones? 
  1. Partido de Derecha
  2. Injerto del Centro
  3. Coalición de Izquierda

Luego pasaremos a revisar el modelo de **respuestas ordenadas**, también conocido como Logit/Probit Ordenado. Las opciones involucran un ordenamiento implicito. Algunos ejemplos son: 

- Evaluar la calidad del servicio recibido seleccionando entre una de las siguientes tres opciones:
  1. Excelente
  2. Bueno
  3. Malo

Al igual que el caso del Logit/Probit, se parte por asociar funciones de probabilidad a las elecciones u opciones, y por ende la técnica que emplearemos para obtener los parámetros estimados es el {ref}`Ch_MLE`. Es decir, el ejercicio se centrará en plantear la función de verosimilitud.

Referencia: Esta subsección sigue de cerca el capítulo 15 de {cite:t}`cameron2005`.

## Multinomial Logit

La variable dependiente asocia más de dos alternativas cualitativas y estas no involucran un orden. Por ejemplo, elegir un lugar para pescar: $y_i\in\{playa,bote,muelle\}$. 

Siguiendo la idea de los modelos de utilidad aleatoria, se compara la probabilidad de escoger una opción particular sobre las demás, dadas unas características observables. En particular, Una forma de extender el modelo es pensar que se comparan de a dos opciones a la vez, tal como hicimos en el logit, y a esto se le asocia una probabilidad. Se emplea principalmente la f.d.p. logística y se tiende a evitar la distribución normal ya que es computacionalmente más compleja de trabajar. 

Sean $J+1$ alternativas u opciones, en donde se deja una categoría como base de comparación. Así, las funciones de probabilidad asociadas a cada opción serían

$$Pr(Y=0|\boldsymbol{X})=\frac{1}{\left[1+\sum_{j=1}^J{exp(X\beta^{(j)})}\right]}$$

$$Pr(Y=j|\boldsymbol{X})=\frac{exp(X\beta^{(j)})}{\left[1+\sum_{j=1}^J{exp(X\beta^{(j)})}\right]}\hspace{0.1cm},\hspace{0.5cm}j=1,...,J$$

Notar que los coefficientes varian por opción y que si $J=1$ solo hay dos opciones y lo anterior colapsa en el modelos logit bivariado. 

Con estas probabilidades, 



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
