%% IE3042 - Temas Especiales de Electr�nica y Mecatr�nica 2
%  Algoritmo k-means
%  C�digo original por: Alina Zare
%  Modificado y comentado por: Luis Alberto Rivera

% Entradas: X - matriz con las muestras como vectores fila (Nxd)
%           m - n�mero de clusters deseado
%          op - opci�n para ir mostrando los resultados parciales o no
%               Si op = 0, no se muestran los datos. Si op > 1, se muestran los
%               datos en la figura n�mero op (debe ser n�mero entero).
%               Esta opci�n se ignora si la dimensionalidad de los datos no es 2.

% Salidas:  E - Vector con las etiquetas asignadas a las muestras
%     centros - Matriz con los representantes de los clusters formados ("centros").
function [E, centros] = k_means(X, m, op)
% Par�metros para detener el algoritmo
MaxIter     = 2000;     % se puede ajustar seg�n se necesite
StopThresh  = 1e-7;     % se puede ajustar seg�n se necesite

dim = size(X,2);    % dimensionalidad de los datos
if dim ~= 2
    op = 0;     % La opci�n de graficar s�lo se considera si los datos son bidimensionales
end

if(op ~= 0)
    figure(op); clf;    % Para limpiar la figura
end

% Inicializar los centros tomando muestras al azar (se podr�an usar otros m�todos)
N = size(X,1);      % n�mero de muestras
rp = randperm(N);   % permutaci�n aleatoria de los n�meros 1:N
centros = X(rp(1:m),:); % selecciona los primeros m puntos, ordenados seg�n rp

diferencia = inf;
iter = 0;

% El algoritmo sigue mientras la diferencia entre los centros sea mayor que
% un umbral, y no se haya llegado al n�mero m�ximo de iteraciones.
while(diferencia > StopThresh && iter < MaxIter)
    % Asignar los datos al cluster m�s cercano, usando los representantes actuales
    D = pdist2(X, centros);
    [~,E] = min(D, [], 2);
    
    if op ~= 0
        % Muestra el clustering actualizado
        figure(op);
        hold off;
        scatter(X(:,1), X(:,2), 20, E, 'filled');
        hold on;
        scatter(centros(:,1), centros(:,2), 100, 'k', 'filled');
        title(['Iteraci�n: ', num2str(iter), ' Diferencia: ', num2str(diferencia)]);
        pause(0.25);  % 0.01
    end
    
    % Actualiza los representates de los clusters
    centrosPrev = centros;
    for j = 1:m
        centros(j,:) = mean(X(E == j,:));   % promedio de los vectores con etiqueta j
    end
    
    % Actualiza la differencia y el contador de iteraciones, para el criterio de detenci�n
    diferencia = norm(centrosPrev - centros);
    iter = iter+1;
end

if op ~= 0
    % Mostrar el clustering final
    figure(op);
    hold off;
    scatter(X(:,1), X(:,2), 20, E, 'filled');
    hold on;
    scatter(centros(:,1), centros(:,2), 100, 'k', 'filled');
    title(['FINAL - Iteraciones: ', num2str(iter), ' Diferencia: ', num2str(diferencia)]);
    grid on;
    pause(0.01);
end

end


