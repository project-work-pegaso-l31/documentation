@echo off
rem =============================================================
rem  FinEdge Ledger – windows_setup.cmd
rem  Scarica e pre-compila tutte le dipendenze:
rem     • backend  → Maven Wrapper (offline cache)
rem     • frontend → npm install
rem  Da eseguire una sola volta dopo il clone.
rem =============================================================

echo.
echo #############################################################
echo #  F I N E D G E   –   S E T U P   (Windows)               #
echo #############################################################
echo.

:: ---------- prerequisiti rapidi -------------------------------
echo Requisiti minimi:
echo   - JDK 17 in PATH   (java -version)
echo   - Node ^>= 18       (node -v)
echo   - npm  ^>= 9        (npm -v)
echo.

:: ---------- BACKEND (Maven) -----------------------------------
echo === BACKEND =================================================
cd /d backend\FinedgeLedgerApi || goto error_path
echo [1/2] Download dipendenze Maven…
call mvnw -q dependency:go-offline
if %errorlevel% neq 0 goto error_maven
echo OK.
cd /d ..\..  :: torna alla root

:: ---------- FRONTEND (npm) ------------------------------------
echo.
echo === FRONTEND ===============================================
cd /d frontend || goto error_path
echo [2/2] npm install…
call npm install --silent
if %errorlevel% neq 0 goto error_npm
echo OK.
cd /d ..      :: torna alla root

echo.
echo #############################################################
echo #  Setup completato con successo!                           #
echo #  Ora puoi avviare l’app seguendo le istruzioni di          #
echo #  GUIDA_AVVIO_WINDOWS.md                                   #
echo #############################################################
pause
exit /b 0

:error_path
echo Cartella non trovata. Lancia lo script dalla root del repo.
pause
exit /b 1

:error_maven
echo Errore durante il download delle dipendenze Maven.
echo Verifica di avere Java 17 installato e riprova.
pause
exit /b 1

:error_npm
echo Errore npm. Controlla che Node/npm siano nel PATH e riprova.
pause
exit /b 1
