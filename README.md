# 📏 Medidor Metro - Flutter

Aplicación de realidad aumentada para medir distancias en iPhone 16 Plus usando Flutter y ARKit.

## 🎯 Características

- ✅ **Mediciones en Realidad Aumentada** - Usa ARKit para detectar puntos en 3D
- ✅ **Interfaz Material Design 3** - Moderna y responsiva
- ✅ **Historial de Medidas** - Guarda todas tus mediciones automáticamente
- ✅ **Estadísticas** - Ver promedio, máximo, total de mediciones
- ✅ **Persistencia Local** - Usa SharedPreferences para guardar datos
- ✅ **Multiplataforma** - Funciona en iOS y Android

## 🛠️ Requisitos Previos

### Windows
- **Flutter SDK** 3.13.0 o superior
- **Android Studio** o emulador Android
- **Visual Studio Code** o **Android Studio**
- **Git**

### macOS (para compilar a iOS)
- **Xcode** 15.0+
- **Cocoapods**

## 📦 Instalación

### 1. Instalar Flutter en Windows

1. Descarga Flutter: https://flutter.dev/docs/get-started/install/windows
2. Extrae en una carpeta (ej: `C:\flutter`)
3. Agrega Flutter al PATH:
   - Abre PowerShell como Admin
   - Ejecuta: `[Environment]::SetEnvironmentVariable("PATH", "$env:PATH;C:\flutter\bin", "User")`

4. Verifica:
```bash
flutter doctor
```

### 2. Navega al Proyecto

```bash
cd "C:\Users\dfgar\Documents\MedidorMetro-Flutter"
```

### 3. Instalar Dependencias

```bash
flutter pub get
```

## 🚀 Ejecución

### En Windows

```bash
# Ver dispositivos
flutter devices

# Ejecutar
flutter run

# Ejecutar en modo debug
flutter run -v
```

### En Mac (compilar para iOS)

```bash
flutter run -d "iPhone 16 Plus"
```

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada
├── models/
│   └── measurement.dart         # Modelos de datos
├── providers/
│   └── measurement_provider.dart # State management
└── screens/
    ├── home_screen.dart        # Pantalla principal
    ├── ar_screen.dart          # Pantalla de medición
    └── history_screen.dart     # Historial
```

## 🎮 Uso de la Aplicación

1. **Pantalla Principal**: 
   - Ver últimas medidas
   - Ver estadísticas
   - Botón "Iniciar Medición"

2. **Modo AR**:
   - Registra dos puntos
   - Distancia se calcula automáticamente
   - Guarda o cancela

3. **Historial**:
   - Ver todas las mediciones
   - Eliminar medidas individuales

## 📝 Archivos Importantes

- `lib/main.dart` - Punto de entrada
- `lib/providers/measurement_provider.dart` - Lógica de estado
- `pubspec.yaml` - Dependencias

## 🔧 Troubleshooting

### "Flutter is not recognized"
Reinicia PowerShell después de agregar al PATH

### "No emulator found"
Descarga Android Studio desde https://developer.android.com/studio

### "pubspec.yaml not found"
Asegúrate de estar en la carpeta correcta

## 📱 Requisitos de Dispositivo

- **iPhone 16 Plus** (iOS 17.0+)
- **Android** (API 21+)

---

Creado con ❤️ usando Flutter y Dart
