import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/measurement.dart';

class MeasurementProvider extends ChangeNotifier {
  List<Measurement> _measurements = [];
  Measurement? _currentMeasurement;
  List<MapPoint> _currentPoints = [];
  bool _isARAvailable = true;

  List<Measurement> get measurements => _measurements;
  Measurement? get currentMeasurement => _currentMeasurement;
  List<MapPoint> get currentPoints => _currentPoints;
  bool get isARAvailable => _isARAvailable;

  MeasurementProvider() {
    _loadMeasurements();
  }

  void addPoint(MapPoint point) {
    _currentPoints.add(point);

    if (_currentPoints.length >= 2) {
      final distance = _currentPoints[0].distanceTo(_currentPoints[1]);
      _currentMeasurement = Measurement(
        distance: distance,
        timestamp: DateTime.now(),
        points: _currentPoints,
      );
    }

    notifyListeners();
  }

  void saveMeasurement() {
    if (_currentMeasurement != null) {
      _measurements.add(_currentMeasurement!);
      _saveMeasurements();
      notifyListeners();
    }
  }

  void clearCurrent() {
    _currentPoints = [];
    _currentMeasurement = null;
    notifyListeners();
  }

  void deleteMeasurement(String id) {
    _measurements.removeWhere((m) => m.id == id);
    _saveMeasurements();
    notifyListeners();
  }

  void clearAll() {
    _measurements = [];
    _currentPoints = [];
    _currentMeasurement = null;
    _saveMeasurements();
    notifyListeners();
  }

  Future<void> _saveMeasurements() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = jsonEncode(
        _measurements.map((m) => m.toMap()).toList(),
      );
      await prefs.setString('measurements', jsonData);
    } catch (e) {
      debugPrint('Error saving measurements: $e');
    }
  }

  Future<void> _loadMeasurements() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = prefs.getString('measurements');

      if (jsonData != null) {
        final decoded = jsonDecode(jsonData) as List;
        _measurements = decoded
            .map((m) => Measurement.fromMap(m as Map<String, dynamic>))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading measurements: $e');
    }
  }

  List<Measurement> getRecentMeasurements({int limit = 10}) {
    return _measurements.reversed.take(limit).toList();
  }

  double getAverageMeasurement() {
    if (_measurements.isEmpty) return 0;
    final sum = _measurements.fold<double>(
      0,
      (prev, m) => prev + m.distance,
    );
    return sum / _measurements.length;
  }
}
