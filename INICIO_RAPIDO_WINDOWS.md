# 🚀 Inicio Rápido - Windows

Guía paso a paso para ejecutar la app en Windows.

## ✅ Paso 1: Instalar Flutter

### Opción A: Descarga Manual

1. Ve a https://flutter.dev/docs/get-started/install/windows
2. Descarga **Flutter SDK**
3. Extrae en una carpeta sin espacios (ej: `C:\flutter`)
4. Agrega al PATH:
   - Windows + X → "Símbolo del sistema (Admin)"
   - O abre PowerShell como Admin
   - Ejecuta:
   ```powershell
   [Environment]::SetEnvironmentVariable("PATH", "$env:PATH;C:\flutter\bin", "User")
   ```

### Opción B: Usando Chocolatey

```powershell
choco install flutter
```

### Verificar instalación

```powershell
flutter --version
flutter doctor
```

## ✅ Paso 2: Abrir el Proyecto

Abre PowerShell y navega a la carpeta:

```powershell
cd "C:\Users\dfgar\Documents\MedidorMetro-Flutter"
```

## ✅ Paso 3: Instalar Dependencias

```powershell
flutter pub get
```

## ✅ Paso 4: Ejecutar la App

### En Android Emulator

```powershell
flutter run
```

### En Dispositivo Android Físico

1. Conecta el teléfono por USB
2. Activa "Depuración USB" en Opciones de Desarrollador
3. Ejecuta:
```powershell
flutter run
```

### Verificar dispositivos conectados

```powershell
flutter devices
```

## 🎯 Uso de Hot Reload

Una vez que la app está corriendo:
- Presiona **'r'** para hot reload
- Presiona **'R'** para reiniciar
- Presiona **'q'** para salir

## 🔧 Si hay Errores

### Error: "Flutter is not recognized"

```powershell
# Cierra PowerShell y abre una nueva ventana
```

### Error: "No emulator found"

Descarga Android Studio desde https://developer.android.com/studio

### Limpiar build

```powershell
flutter clean
flutter pub get
flutter run
```

## 📱 Para iOS (requiere Mac)

Si tienes acceso a una Mac, ver INSTRUCCIONES_iOS.md

## ✅ Checklist

- [ ] Flutter SDK instalado
- [ ] `flutter doctor` sin errores
- [ ] Proyecto abierto en PowerShell
- [ ] `flutter pub get` ejecutado
- [ ] Emulador o dispositivo conectado
- [ ] `flutter run` ejecutado exitosamente

---

**¡Listo! Ya deberías tener la app corriendo.**
