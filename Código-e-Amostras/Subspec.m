function output_signal = Subspec(y,Fe)
%Carregar audio polu�do com o ru�do


x=y(5000:end,1).';  %remove parte do inicio do �udio
Nx=length(x);

%Par�metros para o algor�tmo
beta1=0.5;
beta2=1;
lambda=3;

%Par�metros para STFT
NFFT=1024;
window_length=round(0.031*Fe); 
window=hamming(window_length);
window = window(:);
overlap=floor(0.45*window_length); %N�mero de janelas sem overlap

%Par�metros do sinal
t_min=0.1;    %intervalo em segundos para achar o ru�do analisando momento de sil�ncio
t_max=1.00;   

%Constru��o do espectrograma
[S,F,T] = spectrogram(x+i*eps,window,window_length - overlap,NFFT,Fe);
[Nf,Nw]=size(S);

%Extra��o do espectro ruidoso
t_index=find(T>t_min & T<t_max);
absS_noise=abs(S(:,t_index)).^2;
noise_spectrum=mean(absS_noise,2); %average spectrum of the noise 
noise_specgram=repmat(noise_spectrum,1,Nw);

%Calculo do SNR
absS=abs(S).^2;
SNR_est=max((absS./noise_specgram)-1,0); 


%Mapa de atenua��o
an_lk=max((1-((1./(SNR_est+1)).^beta1)),0); 
STFT=an_lk.*S;


%Calculo da inversa STFT
ind=mod((1:window_length)-1,Nf)+1;
output_signal=zeros((Nw-1)*overlap+window_length,1);

for indice=1:Nw %Utilizando overlap-add
    left_index=((indice-1)*overlap) ;
    index=left_index+[1:window_length];
    temp_ifft=real(ifft(STFT(:,indice),NFFT));
    output_signal(index)= output_signal(index)+temp_ifft(ind).*window;
end

%-----------------    Figures   ---------------------------------------- 

%Sinais no tempo
figure
subplot(2,1,1);
t_index=find(T>t_min & T<t_max);
plot([1:length(x)]/Fe,x);
xlabel('Tempo (s)');
ylabel('Amplitude');
hold on;
noise_interval=floor([T(t_index(1))*Fe:T(t_index(end))*Fe]);
plot(noise_interval/Fe,x(noise_interval),'r');
hold off;
legend('�udio Original','Apenas ru�do');
title('Sub. Esp. - �udio Original');

%Sinal com ru�do removido
subplot(2,1,2);
plot([1:length(output_signal)]/Fe,output_signal );
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sub. Esp. - Sinal sem ru�do');

%Espectrograma
t_epsilon=0.001;
figure
S_one_sided=max(S(1:length(F)/2,:),t_epsilon); %Apenas frequ�ncias positivas
pcolor(T,F(1:end/2),10*log10(abs(S_one_sided))); 
shading interp;
colormap('parula');
colorbar;
title('Sub. Esp. - Espectrograma: sinal + ru�do');
xlabel('Tempo (s)');
ylabel('Frequ�ncia (Hz)');

figure
S_one_sided=max(STFT(1:length(F)/2,:),t_epsilon); %Apenas frequ�ncias positivas
pcolor(T,F(1:end/2),10*log10(abs(S_one_sided))); 
shading interp;
colormap('parula');
colorbar;
title('Sub. Esp. - Espectrograma: Apenas o sinal');
xlabel('Tempo (s)');
ylabel('Frequ�ncia (Hz)');

%Gravar output
fileOutput = 'Filtro-SubSpec.wav';
audiowrite(fileOutput,output_signal,Fe);

end