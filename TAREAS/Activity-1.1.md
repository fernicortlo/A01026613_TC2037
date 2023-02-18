# <span style="color: pink" > Activity 3.1 - Regular languages

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## <span style="color: pink" > Names:
- María Fernanda Cortés Lozano
- Arantza Parra Martínez


## <span style="color: pink">Exercises:

1. Let $X$ be a finite set. Give a recursive definition of the set of subsets of $X$ (the Power set of $X$) $P(X)$. Use union as the operator on the definition

    <span style="color: red">_**SOLUTION**_

    I. **Basis:**

    II. **Recursive Step:**

    III. **Closure:**




2. Prove by induction on $n$ that:

    $\sum_{i=0}^{n}i^3 = \frac{n^2(n+1)^2}{4}$

    <span style="color: red">_**SOLUTION:**_

    I. **Basis:** for $n \in o$

    $\sum_{i=0}^{0}i^3 = \frac{0^2(0+1)^2}{4} = 0$

    II.**Inductive Hypothesis:** For $n = k$

    $\sum_{i=0}^{k}i^3 = \frac{k^2(k+1)^2}{4}$

    III. **Inductive Step**: For $n = (k+1)$

    $\sum_{i=0}^{k+1}i^3 = \frac{k+1^2((k+1)+1)^2}{4}$

    $\sum_{i=0}^{k}{k+1}^3 = \frac{(k+1)^2((k+1+1)^2}{4}$ 

    $\frac{k^2(k+1)^2}{4}+(k+1)^3 = \frac{(k+1)^2((k+2)^2}{4}$ 

    $\frac{k^2(k+1)^2+4(k+1)^3}{4} = \frac{(k+1)^2((k+2)^2}{4}$

    $\frac{(k+1)^2+[k^2+4(k+1)]}{4} = \frac{(k+1)^2((k+2)^2}{4}$

    $\frac{(k+1)^2+[k^2+4k+4]}{4} = \frac{(k+1)^2((k+2)^2}{4}$

    <span style="color: pink">$\frac{(k+1)^2+(k^2+4k+4)}{4} = \frac{(k+1)^2(k^2+4k+4)}{4}$

    III. **Closure:** By induction the given equation holds true for all non-negative integers.




3. Using the tree below, give the values of each of the items:
![Tree image](sample_tree.png)

    a. the depth of the tree

    The depth of the tree is $4$

    b. the ancestors of x18

    $x18$ has $4$ ancestors, $x15$, $x10$, $x4$, $x1$

    c. the internal nodes of the tree

    there are nine internal nodes: $x1$, $x2$, $x3$, $x4$, $x5$, $x7$, $x10$, $x13$ and $x15$

    d. the length of the path from $x3$ to $x14$

    the lenght of the path is $3$. 

    $x3$ -> $x7$ -> $x14$

    e. the vertex that is the parent of x16

    the vertex of the parent of x16 is $x10$

    f. the vertices children of x7

    the vertices children of $x7$ are 
