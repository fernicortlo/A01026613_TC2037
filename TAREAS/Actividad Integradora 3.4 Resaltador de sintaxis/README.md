# <span style = "color: lightblue;"> Actividad Integradora 3.4 Resaltador de sintaxis </span>
**Created by Fernanda Cortés and Arantza Parra**

## <span style = "color: lightblue;"> Reflexion </span>

### <span style = "color: lightgreen;"> Solución planteada, los algoritmos implementados y sobre el tiempo de ejecución de estos. </span>

 La solución planteada utiliza expresiones regulares para resaltar la sintaxis de un código fuente Python. Se definen patrones de expresiones regulares para identificar diferentes elementos del lenguaje como comentarios, palabras clave, variables, números, etc. Luego, se aplica la función Regex.replace junto con un map en una función recursiva para envolver los elementos coincidentes con etiquetas HTML y aplicar los estilos CSS correspondientes.

 En cuanto a la complejidad del algoritmo, es necesario considerar el número de líneas en el archivo de entrada y el número de elementos de resaltado en cada línea. La complejidad general se puede estimar como O(L * E), donde L es el número de líneas y E es el número promedio de elementos de resaltado en cada línea.

 Dado que el algoritmo recorre cada línea del archivo y realiza un reemplazo de expresión regular en cada línea, el tiempo de ejecución estará directamente relacionado con el tamaño del archivo y la cantidad de elementos a resaltar. En general, el tiempo de ejecución aumentará a medida que el tamaño del archivo y la complejidad del código aumenten.

 Sin embargo, la ejecución del algoritmo puede ser eficiente en la mayoría de los casos, ya que la mayoría de los archivos de código fuente Python no son tan extensos. Además, el uso de expresiones regulares permite un procesamiento rápido y eficiente en la mayoría de los casos.

 Es importante tener en cuenta que este enfoque basado en expresiones regulares tiene sus limitaciones y no puede proporcionar un análisis de código completo y preciso en todos los casos.

### <span style = "color: lightgreen;">  Complejidad del algoritmo </span>

Para conocer la complejidad del algoritmo podemos dividirlo en dos partes: el procesamiento de las líneas de código y la generación del archivo HTML resultante.

-  <span style = "color: hotpink;"> Procesamiento de las líneas de código algoritmo </span>

La lectura del archivo tiene una complejidad de <span style = "color: hotpink;">O(N)</span>, donde N es la cantidad de caractéres en el código fuente.

Se realiza la división de las líneas utilizando *String split* en tiempo lineal, <span style = "color: hotpink;">O(M)</span>, donde M es la cantidad de líneas en el archivo.

El recorrido y procesamiento de las líneas se realiza con *Enum.map* lo cuál tiene una complejidad de <span style = "color: hotpink;">O(M)</span> en función de la cantidad de líneas en el archivo. 

La reducción de tokens se realiza con *Enum.reduce*, se realiza en un bucle interno por cada línea. Por lo tanto, tiene una complejidad de <span style = "color: hotpink;">O(K)</span>, donde K es la cantidad de tokens definidos.

Finalmente, el reemplazo de expresiones regulares utilizando Expresiones Regulares (Regex).  La función *Replace* tiene una complejidad en función de la longitud de la línea y la cantidad de tokens a reemplazar. 

En el peor caso, en donde hay muchos tokens a reemplazar en una línea larga, puede tener una complejidad de <span style = "color: hotpink;">O(L * K)</span>, donde L es la longitud de la línea y K es la cantidad de tokens.

-  <span style = "color: hotpink;"> Generación del HTML </span>

Para concatenar las líneas utilizamos *Enum.join*, lo cuál tiene una complejidad <span style = "color: hotpink;">O(M)</span> en función a la cantidad de líneas en el código fuente.

Para escribir el archivo HTML sutilizamos *File.write!* esta función tiene una complejidad en función de la cantidad de caracteres a escribir, que en este caso es proporcional a la longitud total del archivo.

## <span style = "color: lightblue;"> ¿Cómo correr el código? </span>

Para correr el código hay dos opciones:

1. La primera y la más simple es correr el siguiente comando en terminal:

    elixir syntax_highlighter.exs

Es importante notar que este útiliza el código fuente de Python proporcionado por las autoras del código. Si quieres probarlo con otros códigos, utiliza la segunda opción.

2. Para esta opción tienes que acceder a la terminal interactiva de Elixir:

Ingresa los siguientes comandos en terminal:

- iex, este comando sirve para ingresar a la terminal interactiva de elixir.

![IEX](/TAREAS/Actividad%20Integradora%203.4%20Resaltador%20de%20sintaxis/images/iex.png)


- c(syntax_highlighter.exs), con este comando cargamos e ingresamos a el archivo al espacio.

Finamlente, una vez que nos encontremos "en el archivo" ingresamos el siguiente comando:

- SyntaxHighlighter.highlight_file("code.py", "syntax_highlighter.html")
    - donde *code.py* se reemplaza por el archivo fuente a analizar y *syntax_highlighter.html* por el nombre del html que se va a generar.

![IEX](/TAREAS/Actividad%20Integradora%203.4%20Resaltador%20de%20sintaxis/images/cSH.png)

En ambos casos, seguir estas instrucciones debería de generar un archivo HTML en que se se puede observar el código con la sintaxis subrayada. 

**Nota:** Este resaltador de funciones solo funciona con el lenguaje Python.