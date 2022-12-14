%definimos la funcion 
 f1 = @(x) x*log(x) - cos(x);
% descomentar para pruebas de la segunda ecuacion 
% f1 =  @(x) exp(-x) -x^2 + 3*x - 2;

% ----------------metodo numerico-------------------

%asignamos el valor del X incial y pedimos los valores que competen a la
%tolerancia buscada
x0 = input("Ingrese el primer valor: ");
x1 = input("Ingrese el segundo valor: ");
tol =input("ingrese el valor de la tolerancia: ");
maxIter = input("ingrese la cantidad maxima de iteraciones ");
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
title('Secante (pares ordenados)')
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
intervalo = (-16: 0.5: 1);
funcLog = p.*intervalo + log(C);
plot(intervalo, funcLog);
title('Secante (p.*intervalo + log(C))')
    xlabel('ln(en)');
    ylabel('ln(en+1)');
    grid on;