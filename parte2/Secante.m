%definimos la funcion 
f1 = @(x) x*log(x) - cos(x);
%asignamos el valor del X incial y pedimos los valores que competen a la
%tolerancia buscada
x0 = input("Ingrese el primer valor: ");
x1 = input("Ingrese el segundo valor: ");
tol = input("Ingrese el valor de la tolerancia: ");
maxIter = input("Ingrese la cantidad maxima de iteraciones: ");
error = abs(f1(x0));
iteraciones = 0;
raiz = [];
errores = [];

%Se calcula la solución aproximada

while error > tol && iteraciones < maxIter
    xn = x1 - (f1(x1)*(x1 - x0))/(f1(x1) - f1(x0));
    x1 = x0;
    x0 = xn;
    %Se calcula el error entorno al valor anterior de x1,x0
    error = abs(x1 - x0); 
    raiz = [raiz, xn];
    iteraciones = iteraciones + 1;
    errores = [errores, error];
end

%calculamos el ln de los errores y procedemos a graficar

Y = log(errores);
plot( [Y(iteraciones - 2), Y(iteraciones - 1) ],[Y(iteraciones - 1), Y(iteraciones)]);

%procedemos a calcular el valor de p y el valor de C

p = (Y(iteraciones) - Y(iteraciones - 1))/(Y(iteraciones - 1) - Y(iteraciones - 2));

C = exp(Y(iteraciones)-p*Y(iteraciones - 1));

%Se crea la funcion logaritmica y se graficará en el intervalo [-2, 2]
intervalo = (-1: 0.5: 1);
funcLog = p.*intervalo + log(C);
plot(intervalo, funcLog); 