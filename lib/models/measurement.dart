import 'package:uuid/uuid.dart';
import 'dart:math';

class Measurement {
  final String id;
  final double distance;
  final DateTime timestamp;
  final List<MapPoint> points;
  final String unit;

  Measurement({
    String? id,
    required this.distance,
    required this.timestamp,
    required this.points,
    this.unit = 'm',
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'distance': distance,
      'timestamp': timestamp.toIso8601String(),
      'points': points.map((p) => p.toMap()).toList(),
      'unit': unit,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      id: map['id'] as String,
      distance: (map['distance'] as num).toDouble(),
      timestamp: DateTime.parse(map['timestamp'] as String),
      points: (map['points'] as List)
          .map((p) => MapPoint.fromMap(p as Map<String, dynamic>))
          .toList(),
      unit: map['unit'] as String? ?? 'm',
    );
  }

  String get formattedDistance => '${distance.toStringAsFixed(2)} $unit';

  String get formattedTime {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}

class MapPoint {
  final double x;
  final double y;
  final double z;

  MapPoint({
    required this.x,
    required this.y,
    required this.z,
  });

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
      'z': z,
    };
  }

  factory MapPoint.fromMap(Map<String, dynamic> map) {
    return MapPoint(
      x: (map['x'] as num).toDouble(),
      y: (map['y'] as num).toDouble(),
      z: (map['z'] as num).toDouble(),
    );
  }

  double distanceTo(MapPoint other) {
    final dx = x - other.x;
    final dy = y - other.y;
    final dz = z - other.z;
    return sqrt(dx * dx + dy * dy + dz * dz);
  }
}
