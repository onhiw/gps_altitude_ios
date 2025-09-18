import Flutter
import UIKit
import CoreLocation

public class SwiftGpsAltitudeIosPlugin: NSObject, FlutterPlugin, CLLocationManagerDelegate {
  var locationManager: CLLocationManager?
  var resultCallback: FlutterResult?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gps_altitude_ios", binaryMessenger: registrar.messenger())
    let instance = SwiftGpsAltitudeIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getGpsAltitude" {
      resultCallback = result
      startLocationUpdates()
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func startLocationUpdates() {
    locationManager = CLLocationManager()
    locationManager?.delegate = self
    locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    locationManager?.requestWhenInUseAuthorization()
    locationManager?.startUpdatingLocation()
  }

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      let altitude = location.altitude
      let accuracy = location.verticalAccuracy

      if #available(iOS 13.4, *) {
        if let source = location.sourceInformation, source.isSimulatedBySoftware == false {
          resultCallback?(["altitude": altitude, "accuracy": accuracy])
          resultCallback = nil
          locationManager?.stopUpdatingLocation()
        }
      } else {
        resultCallback?(["altitude": altitude, "accuracy": accuracy])
        resultCallback = nil
        locationManager?.stopUpdatingLocation()
      }
    }
  }

  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    resultCallback?(FlutterError(code: "LOCATION_ERROR",
                                 message: error.localizedDescription,
                                 details: nil))
    resultCallback = nil
  }
}
