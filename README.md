# EXTRAINSERT-DE-JOGOS

# OTIMIZADOR EXTRAINSERT - Wiimms ISO Tool - LOBO NINTENDISTA

Este é um script em lotes (batch script) para Windows que utiliza o Wiimms ISO Tool (wit) para realizar várias operações em arquivos de imagem de disco (ISO e WBFS) e arquivos de texto BMG. Vou explicar cada parte do código:

# Configuração Inicial:

Apresenta um menu com várias opções numeradas para diferentes operações.
Solicita ao usuário que digite o número correspondente à operação desejada.

# Execução da Operação Escolhida:

Com base na escolha do usuário, chama a função correspondente. As opções são:
1 Converte arquivos de WBFS para ISO ou vice-versa.
2 Renomeia um disco existente.
3 Extrai pastas de um disco WBFS ou ISO.
4 Reinsere pastas em um disco WBFS ou ISO.
5 Converte arquivos de .bmg para .txt.
6 Converte arquivos de .txt para .bmg.

# Funções Específicas:

- Pede ao usuário os nomes do arquivo de entrada e de saída e executa a conversão usando o Wiimms ISO Tool.
- Pede ao usuário o nome do disco a ser extraído e executa a extração usando o Wiimms ISO Tool.
- Pede ao usuário um novo nome e extensão para salvar um novo disco e recompõe o disco usando o Wiimms ISO Tool.
- Converte arquivos .bmg para .txt em uma determinada pasta.
- Converte arquivos .txt para .bmg em uma determinada pasta.
- Pede ao usuário o nome original do disco e um novo nome, renomeia o arquivo conforme especificado.

Certifique-se de ter o Wiimms ISO Tool instalado em seu sistema e acessível no caminho do sistema para que o script funcione corretamente.
