%definimos la funcion 
 f1 = @(x) x*log(x) - cos(x);
% descomentar para pruebas de la segunda ecuacion 
% f1 =  @(x) exp(-x) -x^2 + 3*x - 2;

%declaramos las expresiones correspondientes a la derivada de la funcion
 df1dx = @(x) log(x) + 1 + sin(x);
% descomentar para pruebas de la segunda ecuacion
% df1dx = @(x) 3 - exp(-x) - 2*x; 

% ----------------metodo numerico-------------------
%asignamos el valor del X incial y pedimos los valores que competen a la
%tolerancia buscada
X0 = 2; %aqui para el informe hay que probar con diferentes entradas iniciales
tol =input("ingrese el valor de la tolerancia: ");
maxIter = input("ingrese la cantidad maxima de iteraciones ");
error = X0;
iteraciones = 0;
X = abs(X0);
raiz = [X0];
errores = [error];

%procedemos con la iteracion
while error > tol && iteraciones < maxIter
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

%calculamos el ln de los errores y procedemos a graficar

LOGS = log(errores);

%eliminamos el primer elemento de los errores ya que es uno artificialmente
%añadido para efectos del loop
Y = [];
for i = 3:iteraciones 
    Y = [Y , LOGS(i)];
end
X = [];
for i = 2:iteraciones-1
    X = [X , LOGS(i)];
end
plot(X,Y);
title('Newton-Raphson 2 (pares ordenados)')
    xlabel('ln(en)');
    ylabel('ln(en+1)');
    grid on;
%procedemos a calcular el valor de p y el valor de C
pendientes = [];
constantes = [];
for i = 4:iteraciones 

    p = (LOGS(iteraciones) - LOGS(iteraciones - 1))/(LOGS(iteraciones - 1) - LOGS(iteraciones - 2));

    C = exp(LOGS(iteraciones)-p*LOGS(iteraciones - 1));
    pendientes = [pendientes,p];
    constantes = [constantes, C];
end
%calculamos la media de las pendientes y de las constantes
p = mean(pendientes);
C = mean(constantes);

%Se crea la funcion logaritmica y se graficará en el intervalo [-2, 2]
intervalo = (-8: 0.5: 0);
funcLog = p.*intervalo + log(C);
plot(intervalo, funcLog); 
title('Newton-Raphson 2 (p.*intervalo + log(C))')
    xlabel('ln(en)');
    ylabel('ln(en+1)');
    grid on;