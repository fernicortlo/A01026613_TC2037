# Definiciones Recursivas

## Ejercicio 1

Escribe la definición recursiva del conjunto:

$ x = \{3,6,12,24,48,...\}$

I. **Basis** : $3 \in x$

II. **Recursive Step**: If $x \in x$ then $2x \in x$

III. **Closure**: $x \in x$ only if it can be obatined from the basis using a finite number of applications of the recursive step. 

# mathematic inductions
## ejercicio 1
Probar la formula sumatoria:

$\sum_{i=1}^n i =\frac{n(n+1)}{2}$

I. **Basis** :For $n \in 1$

$\sum_{i=1}^1 i =\frac{1(1+1)}{2}$ = 1

II. **Inductive Hypothesis**: For $n = k$

$\sum_{i=1}^k i =\frac{k(k+1)}{2}$

III. **Inductive Step**: For $n = (k+1)$

$\sum_{i=1}^{k+1} i =\frac{(k+1)(k+1)+1}{2}$

$\sum_{i=1}^{k+1} i + (k+1) =\frac{(k+1)(k+1)+1}{2}$

$\frac{k(k+1)}{2} + (k+1) =\frac{(k+1)(k+1)+1}{2}$


## ejercicio 2
Escriba una definición recursiva del conjunto de números primos $P$

I.**Basis**: $2 \in P$

II. **Recursive Step**: A numer $x \in \N$ is prime if for every $p \in P$ it holds that $x > p$ and $x$ mod $p \neq

III. **Inductive Step**:

## Ejercicio 3
Demostración de que $5^n - 1$ es divisible entre 4

I. **Basis**: $n = 1$

$5^1 - 1$ = 5 - 1 = 4

II. **Inductive Hypothesis**: $n = k$

$5^k - 1 = 4m$ for any $m \in \N$

$5^k  = 4m + 1$

III. **Inductive Step**: $n = (k+1)$

$5^{k+1} - 1 = 4n$

$5 \cdot 5^k - 1 = 4n $ 

$5 \cdot (4m + 1) - 1 = 4n $ 

