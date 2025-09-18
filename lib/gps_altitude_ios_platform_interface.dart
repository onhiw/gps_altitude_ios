import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gps_altitude_ios_method_channel.dart';

abstract class GpsAltitudeIosPlatform extends PlatformInterface {
  /// Constructs a GpsAltitudeIosPlatform.
  GpsAltitudeIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static GpsAltitudeIosPlatform _instance = MethodChannelGpsAltitudeIos();

  /// The default instance of [GpsAltitudeIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelGpsAltitudeIos].
  static GpsAltitudeIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GpsAltitudeIosPlatform] when
  /// they register themselves.
  static set instance(GpsAltitudeIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
