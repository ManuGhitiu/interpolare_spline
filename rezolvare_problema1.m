clear; clc; close all;

% Definim functia lui Runge
f = @(x) 1 ./ (1 + 25 * x.^2);

% Domeniul fin de puncte pentru reprezentarea grafica exacta
x_grafic = linspace(-1, 1, 500);
y_exact = f(x_grafic);

% --- Cazul n = 6 ---
n1 = 6;
x_nod1 = linspace(-1, 1, n1 + 1);
y_nod1 = f(x_nod1);
S_6 = interpolare_spline_liniara(x_nod1, y_nod1, x_grafic);

% --- Cazul n = 16 ---
n2 = 16;
x_nod2 = linspace(-1, 1, n2 + 1);
y_nod2 = f(x_nod2);
S_16 = interpolare_spline_liniara(x_nod2, y_nod2, x_grafic);

% --- Afisarea graficelor ---
figure;
plot(x_grafic, y_exact, 'k-', 'LineWidth', 2); hold on;
plot(x_grafic, S_6, 'r--', 'LineWidth', 1.5);
plot(x_grafic, S_16, 'b-.', 'LineWidth', 1.5);
plot(x_nod2, y_nod2, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 4);

legend('f(x) exacta', 'Spline liniara (n = 6)', 'Spline liniara (n = 16)', 'Noduri (n = 16)');
title('Interpolarea spline liniara pentru functia lui Runge');
xlabel('x'); ylabel('y');
grid on;