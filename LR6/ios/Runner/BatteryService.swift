import UIKit
import Flutter

public class BatteryService {
    static func getBatteryLevel() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        return Int(device.batteryLevel * 100)
    }
}
