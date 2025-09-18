import 'package:flutter_test/flutter_test.dart';
import 'package:gps_altitude_ios/gps_altitude_ios.dart';
import 'package:gps_altitude_ios/gps_altitude_ios_platform_interface.dart';
import 'package:gps_altitude_ios/gps_altitude_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGpsAltitudeIosPlatform
    with MockPlatformInterfaceMixin
    implements GpsAltitudeIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GpsAltitudeIosPlatform initialPlatform = GpsAltitudeIosPlatform.instance;

  test('$MethodChannelGpsAltitudeIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGpsAltitudeIos>());
  });

  test('getPlatformVersion', () async {
    GpsAltitudeIos gpsAltitudeIosPlugin = GpsAltitudeIos();
    MockGpsAltitudeIosPlatform fakePlatform = MockGpsAltitudeIosPlatform();
    GpsAltitudeIosPlatform.instance = fakePlatform;

    expect(await gpsAltitudeIosPlugin.getPlatformVersion(), '42');
  });
}
