%definimos la funcion 
f1 = @(x) x*log(x) - cos(x);
%pedimos por entrada los valores de a, b y x0
a = 1;
b = 2;
tol = 0.00000001;
iteraciones = 0;
%se realizan las iteraciones
i = 0;
x0 = 10000; %valor exagerado para la primera iteracion
error = x0;
errores = [];
raiz = [];
A = [];
B = [];
while error > tol 
    m = (b + a)/2;
    if (f1(m) == 0)
        break
    elseif (f1(a)*f1(m)<0) 
        b = m;
    else
        a = m;
    end
    error = abs(x0 - m);
    x0 = m;
    i = i+1;
    raiz = [raiz,m];
    A = [A, a];
    B = [B, b];
    errores = [errores, error];
    iteraciones = iteraciones + 1;

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