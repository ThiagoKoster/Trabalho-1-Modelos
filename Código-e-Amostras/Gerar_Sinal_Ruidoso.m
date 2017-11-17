function [noisy,Fs] = Gerar_Sinal_Ruidoso(audio,ruido,peso)
%audio - Caminho do arquivo de audio limpo (sem ruído)
%ruido-Caminho do arquivo de audio do ruído.
%peso-Ganho do ruído.

[x,Fs] = audioread(audio);      
[y,Fs] = audioread(ruido);

for i = 1:length(x);                    
    x(i) = y(i)*peso + x(i);
end
noisy = x;

audio = audio(1:end-4);
ruido = ruido(1:end-4);
outputName = strcat(audio,'-',ruido,'.wav');
audiowrite(outputName,x,Fs);

end