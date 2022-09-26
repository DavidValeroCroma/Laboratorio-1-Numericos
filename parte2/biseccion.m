%definimos la funcion 
f1 = @(x) x*log(x) - cos(x);
% descomentar para pruebas de la segunda ecuacion 
% f1 =  @(x) exp(-x) -x^2 + 3*x - 2;

% ----------------metodo numerico-------------------

%pedimos por entrada los valores de a, b y x0
a = input("ingrese el valor de a: ");
b = input("ingrese el valor de b: ");
tol = input("ingrese el valor de la tolerancia: ");
iteraciones = 0;
%se realizan las iteraciones
i = input("ingrese la cantidad maxima de iteraciones: ");
x0 = 10000; %valor exagerado para la primera iteracion
error = x0;
errores = [];
raiz = [];
A = [];
B = [];
while error > tol && iteraciones<i 
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
title('Bisección (pares ordenados)')
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
intervalo = (-23: 0.5: 2);
funcLog = p.*intervalo + log(C);
plot(intervalo, funcLog); 
title('Bisección (p.*intervalo + log(C))')
    xlabel('ln(en)');
    ylabel('ln(en+1)');
    grid on;