@echo off
setlocal enabledelayedexpansion

REM =============================================
REM  ANIPOSE PIPELINE + ACTIVACIÓN DEL ENTORNO
REM =============================================

echo =============================================
echo Ejecutando pipeline de Anipose en Windows
echo Orden: filter → calibrate → triangulate → label-2d → label-2d-filter → label-3d → label-combined
echo =============================================

CALL "%CONDA_PREFIX%\..\condabin\conda.bat" activate anipose
IF %ERRORLEVEL% NEQ 0 (
    echo [❌ ERROR] No se pudo activar el entorno Conda 'anipose'.
    echo Verifica que el entorno exista: conda env list
    pause
    exit /b 1
)

REM =============================================
echo Entorno activado. Iniciando pipeline Anipose
echo =============================================

REM Función para verificar errores después de cada paso
:check_error
IF %ERRORLEVEL% NEQ 0 (
    echo [❌ ERROR] Fallo en el paso: %1
    echo El proceso se ha detenido.
    pause
    exit /b %ERRORLEVEL%
)
exit /b 0

REM Paso 1: Filter
echo [1] Filtrando coordenadas...
anipose filter
call :check_error "anipose filter"

REM Paso 2: Calibrate
echo [2] Calibrando cámaras...
anipose calibrate -v
call :check_error "anipose calibrate"

REM Paso 3: Triangulate
echo [3] Triangulando datos 3D...
anipose triangulate
call :check_error "anipose triangulate"

REM Paso 4: Label 2D
echo [4] Etiquetando 2D original...
anipose label-2d
call :check_error "anipose label-2d"

REM Paso 5: Label 2D filtrado
echo [5] Etiquetando 2D filtrado...
anipose label-2d-filter
call :check_error "anipose label-2d-filter"

REM Paso 6: Label 3D
echo [6] Etiquetando 3D...
anipose label-3d
call :check_error "anipose label-3d"

REM Paso 7: Video combinado
echo [7] Generando video combinado...
anipose label-combined
call :check_error "anipose label-combined"

echo =============================================
echo ✅ Pipeline COMPLETADO con éxito.
echo =============================================
pause
exit /b 0

