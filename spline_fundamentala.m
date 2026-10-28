function val = spline_fundamentala(x_nod, i, x)
% Calculeaza functia fundamentala s_{1,i}(x)
% x_nod: vectorul cu nodurile de interpolare [x_0, x_1, ..., x_n]
% i: indicele matematic (de la 0 la n)
% x: vector (sau scalar) cu punctele in care evaluam functia

n = length(x_nod) - 1; % numarul de subintervale
val = zeros(size(x));  % initializam rezultatul cu 0 peste tot

% Indexul k in MATLAB este i + 1 (deoarece MATLAB indexeaza de la 1)
k = i + 1; 

if i == 0
    % Cazul s_{1,0}(x) pe [x_0, x_1]
    idx = (x >= x_nod(1)) & (x <= x_nod(2));
    val(idx) = (x_nod(2) - x(idx)) / (x_nod(2) - x_nod(1));

elseif i == n
    % Cazul s_{1,n}(x) pe [x_{n-1}, x_n]
    idx = (x >= x_nod(n)) & (x <= x_nod(n+1));
    val(idx) = (x(idx) - x_nod(n)) / (x_nod(n+1) - x_nod(n));

else
    % Cazul general s_{1,i}(x) pentru i = 1, ..., n-1
    % Ramura stanga: [x_{i-1}, x_i]
    idx1 = (x >= x_nod(k-1)) & (x <= x_nod(k));
    val(idx1) = (x(idx1) - x_nod(k-1)) / (x_nod(k) - x_nod(k-1));

    % Ramura dreapta: [x_i, x_{i+1}]
    idx2 = (x > x_nod(k)) & (x <= x_nod(k+1));
    val(idx2) = (x_nod(k+1) - x(idx2)) / (x_nod(k+1) - x_nod(k));
end
end