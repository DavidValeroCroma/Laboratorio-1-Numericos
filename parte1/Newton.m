%definimos la funcion 
f1 = @(x) x.^2 - 4 ; 
%declaramos las expresiones correspondientes a la derivada de la funcion
df1dx = @(x) 2*x;
%asignamos el valor del X incial y pedimos los valores que competen a la
%tolerancia buscada
X0 = 4; %aqui para el informe hay que probar con diferentes entradas iniciales
tol = input("Ingrese el valor de la tolerancia: ");
maxIter = input("Ingrese la cantidad maxima de iteraciones: ");
error = X0;
iteraciones = 0;
X = abs(X0);
raiz = [X0];
errores = [error];
%inicializamos las variables de errror auxiliar con valores irrelevantes
errorAux = 0;
errorAuxAux = 0;
errorAuxAuxAux = 0; 
%procedemos con la iteracion
while error > tol & iteraciones < maxIter
    errorAuxAuxAux = errorAuxAux;
    errorAuxAux = errorAux;
    errorAux = error;
    df = df1dx(X);
    fx = f1(X);
    %Se calcula el error en torno al valor anterior de x
    X0 = X;
    X = X - df\fx;
    raiz = [raiz, X];
    error = abs(X-X0); 
    iteraciones = iteraciones + 1;
    errores = [errores, error];

end

Y = log(errores);
plot( [Y(iteraciones - 2), Y(iteraciones - 1) ],[Y(iteraciones - 1), Y(iteraciones)]);

%procedemos a calcular el valor de p y el valor de C

p = (Y(iteraciones) - Y(iteraciones - 1))/(Y(iteraciones - 1) - Y(iteraciones - 2));

C = exp(Y(iteraciones)-p*Y(iteraciones - 1));

%Se crea la funcion logaritmica y se graficará en el intervalo [-2, 2]
intervalo = (-1: 0.5: 1);
funcLog = p.*intervalo + log(C);
plot(intervalo, funcLog); 

