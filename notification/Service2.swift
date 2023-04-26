//
//  Service2.swift
//  notification
//
//  Created by Mohan K on 07/02/23.
//

import UIKit

final class Service2 {
    
    let notificationCenter = NotificationCenter.default
    
    init() {
        // 1A. Custom Notification - register and observe for changes in ViewController
        let buttonTapNotificationName = Notification.Name("buttonTapNotificationName")
        notificationCenter.addObserver(self,
                                       selector: #selector(observingButtonTap(_:)),
                                       name: buttonTapNotificationName,
                                       object: nil)
        
        // 1B. System Notification - register and observe for changes in AppDelegate for didBecomeActiveNotification
        let didBecomeActiveNotificationName = UIApplication.didBecomeActiveNotification
        notificationCenter.addObserver(self,
                                       selector: #selector(observingApplicationDidBecomeActive),
                                       name: didBecomeActiveNotificationName,
                                       object: nil)
    }
    
    deinit {
        // 3. Custom Notification and System Notification will be cleared
        print("Service2: deinit")
        notificationCenter.removeObserver(self)
    }
}

// MARK: - Action
private extension Service2 {
    // 2A. Custom Notification - Method what will be triggered
    @objc func observingButtonTap(_ notification: NSNotification) {
        if let message = notification.userInfo?["my_message_key"] {
            print("📨 Service2: Message from VC arrived with message: \(message)")
        }
    }
    
    // 2B. System Notification - Method what will be triggered
    @objc func observingApplicationDidBecomeActive() {
        print("📨 Service2: Message from UIApplication.didBecomeActiveNotification arrived")
    }
}
