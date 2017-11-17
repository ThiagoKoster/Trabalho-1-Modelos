# Trabalho-1-Modelos

Como utilizar:
Para simplicidade, mantenha os arquivos de audio na mesma pasta que os códigos. Pois o programa utiliza os caminhos para gerar os nomes dos arquivos de output.

# Para gerar um sinal ruidoso, execute o script Gerar_Sinal_Ruidoso. 
Utilize as variáveis fileClean e fileNoise para passar os nomes dos arquivos de audio limpo e ruído respectivamente.
Ele irá salvar um arquivo .wav com o sinal e ruído adicionado. O nome do arquivo gerado será o nome do audio-ruído. 

# Para realizar subtração espectral, utilize o código "codigo_subspec"
Este script realiza o método subtração espectral em uma amostra de áudio poluído com ruído.
Para utilizá-lo, basta passar o nome do arquivo de áudio desejado pela variável filename.
O script criará um novo arquivo de áudio com o nome "Subspec_filename", onde filename é o nome do arquivo original. E também irá gerar as figuras necessárias para avaliação do filtro.

# Para realizar a filtragem de wiener, utilize o código "codigo_wiener"
Este script realiza o método filtragem de Wiener em uma amostra de áudio poluído com ruído.
Para utilizá-lo, basta passar o nome do arquivo de áudio desejado pela variável filename.
O script criará um novo arquivo de áudio com o nome "Subspec_filename", onde filename é o nome do arquivo original. E também irá gerar as figuras necessárias para avaliação do filtro.

Nas pastas "Interferência-X" 

# Subtração Espectral - codigo_subspec.m

#Filtragem de Wiener - codigo_wiener.m
