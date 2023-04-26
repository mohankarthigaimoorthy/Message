//
//  Service1.swift
//  notification
//
//  Created by Mohan K on 07/02/23.
//

import Foundation



final class Service1 {
    
    let notificationCenter = NotificationCenter.default
    
    init() {
        // 1. Custom Notification - register and observe for changes in ViewController
        let notificationName = Notification.Name("buttonTapNotificationName")
        notificationCenter.addObserver(self,
                                       selector: #selector(observingButtonTap(_:)),
                                       name: notificationName,
                                       object: nil)
    }
    
    deinit {
        // 4. Clear the Notification
        print("Service1: deinit")
        notificationCenter.removeObserver(self)
    }
}

// MARK: - Action
private extension Service1 {
    // 2. Method what will be triggered from 1.
    @objc func observingButtonTap(_ notification: NSNotification) {
        // 3. Check if data is passed my Notification
        if let message = notification.userInfo?["my_message_key"] {
            print("📨 Service1: Message from VC arrived with message: \(message)")
        }
    }
}
