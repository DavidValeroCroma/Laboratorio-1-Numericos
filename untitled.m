%definimos la funcion 
f1 = @(x) x.^2 - 4 ; 
%declaramos las expresiones correspondientes a la derivada de la funcion
df1dx = @(x) 2*x;
%asignamos el valor del X incial y pedimos los valores que competen a la
%tolerancia buscada
X0 = 1; %aqui para el informe hay que probar con diferentes entradas iniciales
tol = input("Ingrese el valor de la tolerancia: ");
maxIter = input("Ingrese la cantidad maxima de iteraciones: ");
error = X0;
iteraciones = 0;
X = X0;
raiz = [X0];
errores = [error];
%procedemos con la iteracion
while error > tol & iteraciones < maxIter
    df = df1dx(X);
    fx = f1(X);
    %Se calcula el error en torno al valor anterior de x
    X0 = X;
    X = X - df\fx;
    raiz = [raiz, X];
    error = X-X0; 
    iteraciones = iteraciones + 1;
    errores = [errores, error];
end
