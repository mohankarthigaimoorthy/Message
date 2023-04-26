//
//  ViewController.swift
//  notification
//
//  Created by Mohan K on 07/02/23.
//

import UIKit

final class ViewController: UIViewController {

    
      // MARK: - Variables
      
      let service1 = Service1()
      let service2 = Service2()
      
      let notificationCenter = NotificationCenter.default

      // MARK: - Lifecycle
      
      override func viewDidLoad() {
          super.viewDidLoad()
         
          // Setup UI
          setupUI()
      }
      
      deinit {
          // LAST: Dont forget to remove
          notificationCenter.removeObserver(self)
      }
      
      // MARK: - UI
      
      lazy var postButton: UIButton = {
          let button = UIButton(frame: .zero)
          button.backgroundColor = .blue
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle("Broadcast event", for: .normal)
          button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
          button.layer.cornerRadius = 8
          
          return button
      }()
  }

  // MARK: - Action postButton
  private extension ViewController {
      @objc func buttonTap() {
          print("👆 Tap: Broadcast Notification named: 'buttonTapNotificationName' ")
          // 1. Notification Name
          let notificationName = Notification.Name("buttonTapNotificationName")
          // 2. Custom data, Optional
          let myMessage:[String: String] = ["my_message_key": "my_message_value from VC"]
          // 3. Broadcast the Notification, Named, with userInfo what contains Data
          notificationCenter.post(name: notificationName, object: nil, userInfo: myMessage)
      }
  }


  // MARK: - UI
  private extension ViewController {
      
      private func setupUI() {
          view.backgroundColor = .lightGray

          view.addSubview(postButton)
          postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          postButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
          postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      }
  }
