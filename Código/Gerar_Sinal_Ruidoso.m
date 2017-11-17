clear
clc

% filename = 'noisy.wav';
% [x,Fs] = audioread('1-1.wav');      %Lê o audio 1-1.wav
% %x = x + awgn(x,1)*0.001;            %Adiciona ruido ao audio
% 
% %sound(y,Fs);                        %Reproduz o audio com ruido
% audiowrite(filename,x,Fs);          %Cria o audio com ruido
% 
% ruido = awgn(x,1)*0.001;
% audiowrite('Ruído_Ar_Condicionado.wav',ruido,Fs);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x,Fs] = audioread('Música.wav');
[y,Fs] = audioread('Ruído-Ambiente.wav');

for i = 1:length(x);
    x(i) = y(i)*0.2 + x(i);
end

audiowrite('Interferência_Ruído-Ambiente.wav',x,Fs);

