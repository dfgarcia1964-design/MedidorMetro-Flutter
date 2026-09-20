import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/measurement_provider.dart';
import '../models/measurement.dart';

class ARScreen extends StatefulWidget {
  const ARScreen({Key? key}) : super(key: key);

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modo de Medición'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.camera_alt,
                    size: 80,
                    color: Colors.white54,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Vista de AR',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'iPhone 16 Plus',
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer<MeasurementProvider>(
                    builder: (context, provider, _) {
                      if (provider.currentMeasurement != null) {
                        return Column(
                          children: [
                            const Text(
                              'Distancia Medida',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              provider.currentMeasurement!.formattedDistance,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Text(
                            'Puntos: ${provider.currentPoints.length}/2',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final provider =
                          context.read<MeasurementProvider>();

                      if (provider.currentPoints.isEmpty) {
                        provider.addPoint(
                          MapPoint(x: 0, y: 0, z: 0),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Primer punto registrado'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else if (provider.currentPoints.length == 1) {
                        provider.addPoint(
                          MapPoint(x: 5, y: 0, z: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Segundo punto registrado'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Registrar Punto',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            context.read<MeasurementProvider>().clearCurrent();
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          label: const Text('Cancelar'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Consumer<MeasurementProvider>(
                          builder: (context, provider, _) {
                            final enabled =
                                provider.currentMeasurement != null;
                            return ElevatedButton.icon(
                              onPressed: enabled
                                  ? () {
                                      provider.saveMeasurement();
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Medición guardada',
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                              icon: const Icon(Icons.check),
                              label: const Text('Guardar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                disabledBackgroundColor:
                                    Colors.grey.withOpacity(0.5),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
