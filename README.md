# Trabalho-1-Modelos

Como utilizar:
Para simplicidade, mantenha os arquivos de audio na mesma pasta que os códigos. Pois o programa utiliza os caminhos para gerar os nomes dos arquivos de output.
Execute o script "Trabalho1.m", mudando os valores das variáveis.
-audioLimpo - Caminho para o áudio sem ruído.
-ruido - Caminho para o áudio de ruído utilizado para poluir o audioLimpo.
-ganhoRuido - O ganho utilizado para o ruído.

O script Trabalho1.m irá chamar a função Gerar_Sinal_Ruidoso que irá criar o áudio poluído com o ruído e depois chamar as funções que aplicam os filtros implementados.

# A função Gerar_Sinal_Ruidoso(audio,ruido,peso) gera um sinal ruidoso. 
Utilize as variáveis fileClean e fileNoise para passar os nomes dos arquivos de audio limpo e ruído respectivamente.
Ele irá salvar um arquivo .wav com o sinal e ruído adicionado. O nome do arquivo gerado será o nome do audio-ruído. 

# A função SubSpec(y,Fe) realiza a subtração espectral.
Esta função realiza o método subtração espectral em uma amostra de áudio poluído com ruído. E retorna o sinal já filtrado.
A função criará um novo arquivo de áudio com o nome "Filtro-Subspec.wav". E também irá gerar as figuras necessárias para avaliação do filtro.

# A função Wiener(y,Fs) realiza a filtragem de Wiener.
Esta função realiza o método Filtragem de Wiener em uma amostra de áudio poluído com ruído. E retorna o sinal já filtrado.
A função criará um novo arquivo de áudio com o nome "Filtro-Wiener.wav". E também irá gerar as figuras necessárias para avaliação do filtro.

As pastas "Interferência-X" onde X é o nome de um ruído, possuem os resultados de alguns experimentos já realizados.
