function filtered_speech_wiener = Wiener(y,Fs)
%-----------------Parametros-------------------------%
NFFT = 2^10;            % numero de pontos para a FFT do sinal inteiro
split_length = 512;      % Tamanho da janela em ms
overlap_length = 256;     % overlap entre janelas em ms
L = 10;                 % number of Bartlett averaging windows;
window=hanning(split_length);
overlap=floor(0.45*split_length); 

%--------------------------------------------------------------



x=y(5000:end,1).';  %remove parte do inicio do áudio      
Nx=length(x);                                               

windows = split_hanning(y,split_length,overlap_length,Fs);
ffts = fft(windows);

Y_bart = Bartlett( y, Fs, L, split_length, overlap_length );
magnitudes = abs(ffts);

Yk2s = magnitudes.^2;
t_min = 0.4;
t_max = 2;
noise = y(t_min:t_max*Fs,:);

%----Estimando o PSD do ruído -------%
noise_windows = split_hanning(noise,split_length,overlap_length,Fs);
noise_ffts = fft(noise_windows);
noise_magnitudes = abs(noise_ffts);
Noisek2s = noise_magnitudes.^2;
Pnn = Noisek2s;
%------------------------------------%

%----Fazendo com o que PSD do ruído tenha mesmas dimensões que o sinal---%
while size(Pnn,2) < size(Yk2s,2)
Pnn = horzcat(Pnn,Noisek2s);

end
diference = size(Pnn,2) - size(Yk2s,2);

Pnn(:,(end - diference +1):end) = [];
%------------------------------------------------------------------------%

phases = angle(ffts);

H = 1 - Pnn ./ Y_bart;
S_mag = H.*magnitudes;   %magnitude of speech fft
Sk = S_mag.*exp(phases.*sqrt(-1));
speech_wiener = ifft(Sk);
filtered_speech_wiener = OverlapAdd(speech_wiener, split_length, overlap_length, Fs, size(y,1));

fileoutput = 'Filtro_Wiener.wav';
audiowrite(fileoutput,filtered_speech_wiener,Fs);


%---------------------------------------------------- Figuras ---------


%Construção do espectrograma
[S,F,T] = spectrogram(x+i*eps,window,split_length - overlap,NFFT,Fs);
[Nf,Nw]=size(S);


%Espectrograma
t_epsilon=0.001;
figure
S_one_sided=max(S(1:length(F)/2,:),t_epsilon); %Apenas frequências positivas
pcolor(T,F(1:end/2),10*log10(abs(S_one_sided))); 
shading interp;
colormap('parula');
colorbar;
title('Wiener - Espectrograma: sinal + ruído');
xlabel('Tempo (s)');
ylabel('Frequência (Hz)');




% Visualize time domain signals
%Sinais no tempo
figure
subplot(2,1,1);
t_index=find(T>t_min & T<t_max);
plot([1:length(x)]/Fs,x);
xlabel('Tempo (s)');
ylabel('Amplitude');
hold on;
noise_interval=floor([T(t_index(1))*Fs:T(t_index(end))*Fs]);
plot(noise_interval/Fs,x(noise_interval),'r');
hold off;
legend('Original signal','Noise Only');
title(' Wiener - Áudio Original');

%Sinal com ruído removido
subplot(2,1,2);
plot([1:length(filtered_speech_wiener)]/Fs,filtered_speech_wiener );
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Wiener - Sinal sem ruído');

end
