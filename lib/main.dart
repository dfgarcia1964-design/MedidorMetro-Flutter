import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/measurement_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MedidorMetroApp());
}

class MedidorMetroApp extends StatelessWidget {
  const MedidorMetroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MeasurementProvider()),
      ],
      child: MaterialApp(
        title: 'Medidor Metro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
        ),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
