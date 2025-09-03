@echo off
REM ===============================
REM Script para atualizar/sincronizar
REM arquivos locais com o GitHub
REM ===============================

:: URL do repositório GitHub (edite uma vez e salve)
set "REPO=https://github.com/ivanbsf/ivanbsf.git"

:: Branch principal (padrão: main, pode ser master em alguns repos)
set "BRANCH=main"

echo.
echo ===============================
echo   Sincronizando com o GitHub...
echo ===============================
echo.

:: Ir para a pasta do BAT
cd /d "%~dp0"
git config --global user.email "ivanbsf@gmail.com"
git config --global user.name "ivanbsf"

:: Verifica se já existe repositório
if not exist ".git" (
    echo Nenhum repositório Git encontrado, inicializando...
    git init
    git remote add origin %REPO%
)

:: Adiciona todos os arquivos
git add .

:: Faz commit automático
git commit -m "Atualização automática %date% %time%"

:: Faz pull para evitar conflitos
git pull origin %BRANCH% --rebase

:: Envia arquivos para o GitHub
git push origin %BRANCH%

echo.
echo ✅ Sincronização concluída!
pause
