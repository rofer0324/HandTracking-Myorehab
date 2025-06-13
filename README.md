# Proyecto MYOREHAB

## 🧠 Descripción

**MYOREHAB** es un sistema de análisis de movimiento orientado a la rehabilitación muscular. Utiliza tecnologías de visión computacional como **Anipose** (para triangulación 3D a partir de cámaras múltiples) y **MediaPipe** (para la detección de poses en tiempo real) con el fin de extraer y analizar datos biomecánicos clave a partir de videos.

El objetivo es brindar una herramienta eficiente para fisioterapeutas, investigadores y pacientes, permitiendo el monitoreo objetivo del progreso durante procesos de rehabilitación física.

---

## 📁 Estructura del Proyecto

```
MYOREHAB/
├──environments/
├──recording/
│   ├── calibration/                # Archivos de calibración de cámaras
│   ├── pose-2d/                    # Coordenadas 2D generadas por MediaPipe
│   ├── pose-2d-filtered/           # Coordenadas 2D filtradas
│   ├── pose-3d/                    # Coordenadas 3D trianguladas con Anipose
│   ├── videos-3d/                  # Videos con puntos 3D proyectados
│   ├── videos-combined/            # Videos combinados con visualización
│   ├── videos-labeled/             # Videos con anotaciones
│   ├── videos-labeled-filtered/    # Videos con anotaciones filtradas
│   ├── videos-raw/                 # Videos sin procesar (entrada)
│   ├── mediapipe_analyze.py        # Script principal de análisis con MediaPipe
└── config.toml                     # Archivo de configuración general
└── README.md
```

---

## 💻 Ejecución de Scripts

Asegúrate de haber activado tu entorno virtual y de tener los datos de video correctamente organizados.

### 1. Detección de puntos con MediaPipe

```bash
python scripts/run_mediapipe.py --input data/raw --output data/processed
```

### 2. Calibración y triangulación con Anipose

```bash
anipose calibrate
anipose triangulate
```

### 3. Análisis de movimiento

```bash
python scripts/analyze_motion.py --input data/processed --output results/
```

---

## 📦 Requisitos y versiones

Instala los requerimientos ejecutando:

```bash
pip install -r requirements.txt
```

### Dependencias principales

- Python >= 3.7.12
- OpenCV == 4.9.0  
- NumPy == 1.24.4  
- matplotlib == 3.7.1  
- pandas == 2.0.3  
- tqdm == 4.66.1  
- **MediaPipe** == 0.10.9  
- **Anipose** == 0.9.0  
- SciPy == 1.11.4

---

## 📽 Resultados

Aquí se muestra un ejemplo visual del análisis de movimiento realizado:

<p align="center">
  <img src="pose-3d_gif.gif" alt="Resultados del modelo" />
</p>

---

## 📚 Fuentes y referencias

Durante el desarrollo del proyecto se consultaron las siguientes fuentes:

- [Tutorial de Anipose por Pigeon Supermodel](https://pigeonsupermodel.com/UsingAnipose3D.html#create-directory-structure)  
- [Repositorio oficial de DeepLabCut](https://github.com/DeepLabCut/DeepLabCut/tree/main)  
- [Documentación oficial de Anipose](https://anipose.readthedocs.io/en/latest/tutorial.html)

---

## 📬 Contacto

Para dudas, sugerencias o colaboración, puedes contactar a los desarrolladores del proyecto.
