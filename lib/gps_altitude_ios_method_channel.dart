import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gps_altitude_ios_platform_interface.dart';

/// An implementation of [GpsAltitudeIosPlatform] that uses method channels.
class MethodChannelGpsAltitudeIos extends GpsAltitudeIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gps_altitude_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
