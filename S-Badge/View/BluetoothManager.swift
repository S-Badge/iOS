//import Foundation
//import CoreBluetooth
//import UserNotifications
//import Intents
//
//class BluetoothManager: NSObject, CBCentralManagerDelegate {
//    var centralManager: CBCentralManager!
//    
//    override init() {
//        super.init()
//        centralManager = CBCentralManager(delegate: self, queue: nil)
//    }
//    
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        if central.state == .poweredOn {
//            central.scanForPeripherals(withServices: nil, options: nil)
//        }
//    }
//    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//        central.stopScan()
//        central.connect(peripheral, options: nil)
//    }
//    
//    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//        peripheral.delegate = self
//        peripheral.discoverServices(nil)
//    }
//}
//
//extension BluetoothManager: CBPeripheralDelegate {
//    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
//        if let services = peripheral.services {
//            for service in services {
//                peripheral.discoverCharacteristics(nil, for: service)
//            }
//        }
//    }
//    
//    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
//        if let characteristics = service.characteristics {
//            for characteristic in characteristics {
//                if characteristic.properties.contains(.notify) {
//                    peripheral.setNotifyValue(true, for: characteristic)
//                }
//            }
//        }
//    }
//    
//    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
//        if let data = characteristic.value,
//           let message = String(data: data, encoding: .utf8),
//           message == "1" {
//            sendLocalNotification(titleText: "제목",bodyText: "테스트")
//        }
//    }
//}
//
//func sendLocalNotification(titleText:String,bodyText:String) {
//    let content = UNMutableNotificationContent()
//    content.title = titleText
//    content.body = bodyText
//    content.sound = UNNotificationSound.default
//
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
//    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//    UNUserNotificationCenter.current().add(request) { error in
//        if let error = error {
//            print("Error adding notification: \(error.localizedDescription)")
//        } else {
//            print("푸시 알림이 성공적으로 보내졌습니다.")
//        }
//    }
//    // Siri Intent 발행
//    // deprecated됨
//    let intent = INStartAudioCallIntent()
//    let interaction = INInteraction(intent: intent, response: nil)
//    interaction.donate { (error) in
//        if let error = error {
//            print("Error donating interaction: \(error.localizedDescription)")
//        } else {
//            print("Siri Intent 발행 성공")
//        }
//    }
//}
