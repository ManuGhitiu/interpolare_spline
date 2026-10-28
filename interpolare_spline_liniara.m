function S = interpolare_spline_liniara(x_nod, y_nod, x)
% Calculeaza valoarea functiei spline S_{1,n}(f)(x)
% x_nod: nodurile x_0, ..., x_n
% y_nod: valorile functiei f(x_0), ..., f(x_n)
% x: punctele in care dorim sa evaluam aproximarea

n = length(x_nod) - 1;
S = zeros(size(x));

% Insumam s_{1,i}(x) * f(x_i) pentru i de la 0 la n
for i = 0:n
    S = S + spline_fundamentala(x_nod, i, x) * y_nod(i + 1);
end
end