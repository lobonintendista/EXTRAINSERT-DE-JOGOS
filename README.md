# EXTRAINSERT-DE-JOGOS
OTIMIZADOR EXTRAINSERT - Wiimms ISO Tool - LOBO NINTENDISTA

Este é um script em lotes (batch script) para Windows que utiliza o Wiimms ISO Tool (wit) para realizar várias operações em arquivos de imagem de disco (ISO e WBFS) e arquivos de texto BMG. Vou explicar cada parte do código:

Configuração inicial:

@echo off: Desativa a exibição dos comandos no prompt de comando.
title OTIMIZADOR EXTRAINSERT - Wiimms ISO Tool - LOBO NINTENDISTA: Define o título da janela do prompt de comando.
setlocal enabledelayedexpansion: Habilita o uso de variáveis de ambiente adiadas.
Mensagens de apresentação e instruções:

Exibe informações sobre o script, dicas de uso e instruções para escolher uma funcionalidade.
Menu de escolha:

Exibe opções numeradas para escolher a função desejada.
Solicita ao usuário que digite o número correspondente à operação desejada.
Lógica de escolha:

Usa estruturas condicionais (if e else if) para direcionar o fluxo do programa com base na escolha do usuário.
Cada escolha chama uma função específica.
Funções:

:converterFiles: Solicita ao usuário os nomes do arquivo de entrada e saída, e usa o Wiimms ISO Tool para converter entre formatos (ISO para WBFS ou vice-versa).
:extractFiles: Solicita ao usuário o nome do disco a ser extraído e utiliza o Wiimms ISO Tool para extrair os arquivos.
:recomposeFiles: Solicita ao usuário o nome do novo disco a ser criado e utiliza o Wiimms ISO Tool para recompor os arquivos.
:unBMG: Decodifica todos os arquivos BMG em uma pasta para arquivos de texto.
:divBMG: Codifica todos os arquivos de texto em uma pasta para arquivos BMG.
:reNome: Renomeia um arquivo de disco com base no nome original e novo fornecido pelo usuário.
Finalização:

:end: Encerra o script.

Certifique-se de ter o Wiimms ISO Tool instalado em seu sistema e acessível no caminho do sistema para que o script funcione corretamente.
