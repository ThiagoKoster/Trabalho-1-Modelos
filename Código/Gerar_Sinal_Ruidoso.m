clear
clc

% filename = 'noisy.wav';
% [x,Fs] = audioread('1-1.wav');      %L� o audio 1-1.wav
% %x = x + awgn(x,1)*0.001;            %Adiciona ruido ao audio
% 
% %sound(y,Fs);                        %Reproduz o audio com ruido
% audiowrite(filename,x,Fs);          %Cria o audio com ruido
% 
% ruido = awgn(x,1)*0.001;
% audiowrite('Ru�do_Ar_Condicionado.wav',ruido,Fs);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x,Fs] = audioread('M�sica.wav');
[y,Fs] = audioread('Ru�do-Ambiente.wav');

for i = 1:length(x);
    x(i) = y(i)*0.2 + x(i);
end

audiowrite('Interfer�ncia_Ru�do-Ambiente.wav',x,Fs);

