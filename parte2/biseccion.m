%definimos la funcion 
f1 = @(x) x*log(x) - cos(x);
%pedimos por entrada los valores de a, b y x0
a = 1;
b = 2;
tol = 0.00000001;
iter = 1000000;
%se realizan las iteraciones
i = 0;
x0 = 10000; %valor exagerado para la primera iteracion
error = x0;
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
end

