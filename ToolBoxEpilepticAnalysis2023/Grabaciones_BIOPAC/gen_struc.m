%--------------------------------------------------------------------------
%  Nombre:      Cristhofer Patzán
%  Carné:       19219
%  Descripcion: Toma los datos almacenados en el documento standar de UVG
%               para BIOPAC y los convierte en un struct, para poder usar
%               dichos datos en la ToolBox.
%--------------------------------------------------------------------------
function gen_struc(filename, save_name)
   
    signal = readmatrix(filename);

    eeg_struct.data = signal(:,2)';
    eeg_struct.data_length_sec = size(eeg_struct.data,2);
    eeg_struct.sampling_frequency = signal(1,8);
    eeg_struct.channels = {'Canal 1'};

    save(save_name,'eeg_struct')
    
end