@echo off
title OTIMIZADOR EXTRAINSERT - Wiimms ISO/SZS Tools - LOBO NINTENDISTA
setlocal enabledelayedexpansion

echo.
echo        *** EXTRAINSERT Wiimms ISO/SZS Tool ***
echo.
echo        Dica para usar:    Certifique-se de ter  
echo        instalado em seu sistema os aplicativos
echo        Wiimms ISO Tools: https://wit.wiimm.de/
echo        Wiimms SZS Tools: https://szs.wiimm.de/
echo.
echo        ***************************************
echo        ******  ESCOLHA UMA PROGRAMACAO  ******
echo        ***************************************
echo.
echo   * FUNCOES WIT:
echo.
echo  - (CONVERTER: ISO em WBFS ou WBFS em ISO)  = Digite: 1
echo  - (PARA RENOMEAR UM DISCO EXISTENTE )      = Digite: 2
echo.
echo  - (EXTRAIR ARQUIVO de DISCO .ISO ou .WBFS) = Digite: 3
echo  - (REFAZER ARQUIVO em DISCO .ISO ou .WBFS) = Digite: 4
echo.
echo   * FUNCOES SZS:
echo.
echo  - (CONVERTER ARQUIVOS de .bmg para .txt)   = Digite: 5
echo  - (CONVERTER ARQUIVOS de .txt para .bmg)   = Digite: 6
echo.


:getUserChoice
set /p choice=- Digite um dos numeros para a funcao desejada: 
echo.
if "%choice%" equ "3" (
    call :extractFiles
) else if "%choice%" equ "1" (
    call :converterFiles
) else if "%choice%" equ "4" (
    call :recomposeFiles
) else if "%choice%" equ "5" (
    call :unBMG
) else if "%choice%" equ "6" (
    call :divBMG
) else if "%choice%" equ "2" (
    call :reNome
) else (
echo.
    echo Voce digitou opcao invalida, tente as opcoes de 1 a 6!
echo.
    goto getUserChoice
)

:end
endlocal
exit /b 0

:converterFiles
set /p input_iso=- Digite o nome do disco com a extensao original (.iso ou .wbfs):
set /p output_iso=- Digite o nome do disco com a extensao que deseja converter (.iso ou .wbfs):

echo.
echo Convertendo o arquivo.   Por favor, aguarde ate que esta tela feche sozinha ...
echo.
wit copy %input_iso% %output_iso%
echo Processo concluido!
goto end

:extractFiles
set /p "filename=- Digite o "nome do disco" que deseja extrair, "com a extensao" (exemplo: game.wbfs ou game.iso): "
echo.
if not exist "%filename%" (
    echo Arquivo nao encontrado. Verifique se o disco esta "no mesmo arquivo" que este EXTRAINSERT.
echo.
    goto getUserChoice
)
echo.
echo Extraindo os arquivos.   Por favor, aguarde ate que esta tela feche sozinha ...
echo.
wit extract "%filename%" hack
echo.
echo Processo concluido!
goto end

:recomposeFiles
set /p "filename=- Digite um "novo nome" com a extensao, para salvar um novo disco (exemplo: novo.wbfs ou novo.iso): "

if not exist "hack" (
echo.
    echo pasta 'hack' nao encontrada. Certifique-se de ter feito a extracao do disco ou que ela esteja na pasta do EXTRAINSERT.
echo.
    goto getUserChoice
)
echo.
echo Refazendo um Disco de jogo.   Por favor, aguarde ate que esta tela feche sozinha ...
echo.
wit copy hack "%filename%" -o
echo Processo concluido!
goto end


:unBMG
set "pasta=C:\Caminho\Para\Sua\Pasta"  REM Substitua pelo caminho da sua pasta

cd "%pasta%"

:processar_pasta2
for %%f in (*.bmg) do (
    set "nomeArquivo=%%~nf"
    wbmgt decode "!nomeArquivo!.bmg"
)

for /D %%d in (*) do (
    cd "%%d"
    call :processar_pasta2
    cd ..
)

echo Conversao de bmg em txt em andamento.
goto :end


:divBMG
set "pasta=C:\Caminho\Para\Sua\Pasta"  REM Substitua pelo caminho da sua pasta

cd "%pasta%"

:processar_pasta1
for %%f in (*.txt) do (
    set "nomeArquivo=%%~nf"
    wbmgt encode "!nomeArquivo!.txt"
)

for /D %%d in (*) do (
    cd "%%d"
    call :processar_pasta1
    cd ..
)

echo Conversao de txt em bmg em andamento.
goto :end


:reNome
setlocal enabledelayedexpansion

set /p "nomeOriginal=- Digite o nome do disco original (incluindo a extensao original): "
set /p "novoNome=- Digite um "novo nome" para o disco (incluindo a extensao original): "

rem Obtém o caminho do arquivo a partir do nome original
for %%F in ("%nomeOriginal%") do (
    set "caminhoArquivo=%%~dpF"
)

cd %caminhoArquivo%

rem Renomeia o arquivo conforme especificado
ren "%nomeOriginal%" "%novoNome%"
echo Renomeado: "%nomeOriginal%" para "%novoNome%"

endlocal
