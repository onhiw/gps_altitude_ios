import 'dart:async';
import 'package:flutter/services.dart';

class GpsAltitudeIos {
  static const MethodChannel _channel = MethodChannel('gps_altitude_ios');

  /// Get raw GPS altitude (HAE/Ellipsoid height) with accuracy
  static Future<Map<String, dynamic>?> getGpsAltitude() async {
    try {
      final result = await _channel.invokeMethod("getGpsAltitude");
      if (result != null) {
        return Map<String, dynamic>.from(result);
      }
    } on PlatformException catch (e) {
      throw Exception("Failed to get GPS altitude: ${e.message}");
    }
    return null;
  }
}
