%% NOTA: ESTA VERSI�N CONTIENE CAMBIOS REALIZADOS POR DAVID VELA-17075 
%Cambio de una Fs fija a una introducida a la funci�n, colocar en el 
% comentario de "op" del orden de los par�metros en la "Matriz_features", 
%implementar el filtrado Butterworth con la funci�n "butter" y remover 
%el filtrado de la frecuencia el�ctrica. Adici�n de la caracter�stica 
%de LZX (en progreso) y energ�a acumulada

function [Matriz_features,channel_ventana,c] = FeaturesV2(edf,fs,canales,muestras,c,op)
% ARGUMENTOS DE LA FUNCION
%edf:   archivo .edf con se�al EEG a analizar
%canales: n�mero de canales para encontrar features (de 1 a 4 canales)
%muestras: n�mero de muestras para realizar ventanas
%op: vector de opciones

%Se arreglan las dimensiones para que se tengan vectores fila en caso
%la se�al venga en vectores columna.
if size(edf,1)>size(edf,2)
    edf = edf';
end
ctot = size(edf,1);
eeg = zeros(length(edf),canales);
if c==0
%Definir canales a analizar
    canales = ctot;
    eeg = edf';
else
    for i=1:canales
        eeg(:,i)= edf(c(i),:)';
    end
end

%Preprocesamiento: FILTROS
%Se crea un filtro pasa bandas con un filtro Butterworth pasa bajas
%y otro pasa altas.
Fclp = 85; %Frequencia de corte para el pasa bajas
Fchp = 0.5; %Frequencia de corte para el pasa altas
W_blp = Fclp/(fs/2); % Normalizaci�n de la frecuencia de corte pasa bajas
W_bhp = Fchp/(fs/2); % Normalizaci�n de la frecuencia de corte pasa altas
[blp,alp]= butter(2,W_blp, 'low'); % Filtro pasa bajo de segundo orden.
[bhp,ahp]= butter(2,W_bhp, 'high'); % Filtro pasa bajo de segundo orden.
%Se pasan ambos filtros 2 veces
channelsf1 = filtfilt(blp,alp,eeg); 
channels = filtfilt(bhp,ahp,channelsf1);

%Realizar ventana
k=1;        %recorrer canales
j=0;
flag=0;
size_c = length(channels);
channel_ventana = zeros(size_c,canales);
if mod(size_c/muestras,1)~=0 %si es decimal
    if(((size_c/muestras)-round(size_c/muestras))<0)
        size_cint = round(size_c/muestras)-1;
    else
        size_cint = round(size_c/muestras);
    end
else
   size_cint = size_c/muestras; 
end
z = zeros(length(eeg),canales);
zc = zeros(size_cint,canales);
mav = zeros(size_cint,canales);
desviacion = zeros(size_cint,canales);
curtosis = zeros(size_cint,canales);
lzx = zeros(size_cint,canales);
eac = zeros(size_cint,canales);
%Subventanas para la EAC
ventana_EA = 10;
%Muestras de cada subventana EAC
muestas_ventana_EA = round(muestras/ventana_EA);
if ((muestras - muestas_ventana_EA*ventana_EA)<0)
    muestas_ventana_EA = muestas_ventana_EA-1;
end
%Zero Crossing index function
max_amplitud = max(abs(channels))*0.02; % 2% de la amplitud de la se�al 
umbral = max(max_amplitud);
for i=1:canales
   z(:,i) =  ZC(channels(:,i),umbral)'; %Calcular todos los ZC de la se�al
end
i=1;
while(1)
     
    channel_ventana(i,k) = channels(i,k); 
    i = i+1;   
    if(mod(i,(muestras))==0)      %Calcular caracteristicas de cada ventana
        %WindowSignal es un canal de la se�al; dimension n x 1
        window_signal = channel_ventana((j*muestras)+1:i,k);
        flag = flag+1;
        
        if op(1) == 1
         desviacion(flag,k) = std(channel_ventana(:,k));
         %desviacion(flag,k) = std(window_signal);
        end
        
        if op(2) == 1
         curtosis(flag,k) = kurtosis(channel_ventana(:,k));
         %curtosis(flag,k) = kurtosis(window_signal);
        end
        
        if op(4) == 1
            mav(flag,k) = mean(abs(channel_ventana((j*muestras)+1:i,k)));
        end
        
        if op(5) == 1
        %Energ�a acumulada por ventana (10 sub ventanas)
            for iteac=0:ventana_EA-1
                lowbound = iteac*muestas_ventana_EA+1;
                highbound = (iteac+1)*muestas_ventana_EA;
                size(eac);
                if (ventana_EA*muestas_ventana_EA<highbound)
                    break
                end
              eac(flag,k)=eac(flag,k)+var(window_signal(lowbound:highbound,1));
            end
        end
        if op(6) == 1
        %FUNCI�N DESHABILITADA POR SU REQUERIMIENTO DE TIEMPO
            binlzx = (mean(abs(window_signal)))<=window_signal;
            s = binary_seq_to_string(binlzx);
            [lzx(flag,k), ~] = calc_lz_complexity(s,'exhaustive', 1);
        end
        if op(3) == 1
            if(j>0) %contar ZC por cada ventana
                for o=1:canales
                    zc(flag,o) = sum(z(j*muestras:i,o) == 1);
                end  
            else
                for o=1:canales
                     zc(flag,o) = sum(z(1:(i-1),o) == 1);
                end 
            end
        end
        j= j+1;   
    end
     if (i==size_c) 
            k=k+1;
            flag=0;
            i=1; 
            j=0;   
     end  
     if(k>canales)
            break;
     end
end
%Concatenar vector de caracter�sticas
a=0;
for i=1:canales
  totfeatures(:,i+a:((i+a)+5)) = [desviacion(:,i),curtosis(:,i),zc(:,i),mav(:,i),eac(:,i),lzx(:,i)];
  a=a+5;
end
resta=1;

% Prealocar vfeatures con un tama�o m�ximo posible. (CP)
vfeatures = zeros(size(totfeatures, 1), sum(op));

for j=1:canales
    for i=1:6
       if op(i)==1 
           vfeatures(:,resta) = totfeatures(:,i); %eliminar columna no deseada
           resta=resta+1;  
       end
    end
end

% Ajustar vfeatures al tama�o real necesario. (CP)
vfeatures = vfeatures(:, 1:resta-1);

Matriz_features = vfeatures;
end

