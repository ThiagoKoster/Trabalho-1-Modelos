
%Trabalho - 1 - Thiago Koster Lago

audioLimpo = 'M�sica.wav';          %Caminho do audio sem ruido

ruido = 'ru�do_branco.wav';         %Caminho do audio do ruido

ganhoRuido = 1;                   %Ganho do ruido

[noisy,Fs] = Gerar_Sinal_Ruidoso(audioLimpo,ruido,ganhoRuido);

subspec=Subspec(noisy,Fs);             %Realiza o filtro Subtra��o Espectral
wiener = Wiener(noisy,Fs);             %Realiza o filtro de Wiener
