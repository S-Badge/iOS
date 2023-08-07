//
//  OrientationManager.swift
//  S-Badge
//
//  Created by ram on 2023/08/05.
//

//import CoreMotion
//import UIKit
//
//class OrientationManager {
//    private let motionManager = CMMotionManager()
//
//    var currentOrientation: UIDeviceOrientation {
//        if let accelerometerData = motionManager.accelerometerData {
//            let acceleration = accelerometerData.acceleration
//
//            if acceleration.x >= 0.75 {
//                return .landscapeLeft
//            } else if acceleration.x <= -0.75 {
//                return .landscapeRight
//            } else if acceleration.y <= -0.75 {
//                return .portrait
//            } else if acceleration.y >= 0.75 {
//                return .portraitUpsideDown
//            }
//        }
//
//        return .unknown
//    }
//
//    func startOrientationUpdates() {
//        if motionManager.isAccelerometerAvailable {
//            motionManager.accelerometerUpdateInterval = 0.2
//            motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
//                guard error == nil else { return }
//                // 방향 변경 시 동작 처리
//                // 예: self?.handleOrientationChange()
//            }
//        }
//    }
//
//    func stopOrientationUpdates() {
//        motionManager.stopAccelerometerUpdates()
//    }
//}
//
