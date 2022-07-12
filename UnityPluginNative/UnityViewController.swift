//
//  UnityViewController.swift
//  UnityPluginNative
//
//  Created by ByungHoon Ann on 2022/07/12.
//


import UIKit
import UnityiOSPlugin

final class UnityViewController: NSObject {
    var unityNavigationController: UINavigationController
    
    var viewController: UIViewController {
        unityNavigationController.topViewController ?? UIViewController()
    }
    
    var nativeButton = UIButton(type: .system)
    
    init(navigationController: UINavigationController) {
        self.unityNavigationController = navigationController
        super.init()
         setupLayout()
    }
    
    func setupLayout() {
        let screenSize = UIScreen.main.bounds.size
        viewController.view.addSubview(nativeButton)
        nativeButton.setTitle("Native Button", for: .normal)
        nativeButton.setTitleColor(.black, for: .normal)
        nativeButton.backgroundColor = .white
        nativeButton.addTarget(self, action: #selector(tappedNativeButton(_:)), for: .touchUpInside)
        nativeButton.frame = CGRect(x: screenSize.width/4,
                                    y: screenSize.height/8,
                                    width: screenSize.width/2,
                                    height: 50)
        
    }
    
    @objc func tappedNativeButton(_ sender: UIButton) {
        print("tappedNativeButton!")
        
        if let sendMessageManager = TestManager.sharedInstance().messageHandler {
            guard let text = NSString(string: "Native Send Text").utf8String else { return }
            sendMessageManager(text)
        } else {
            
        }
    }
}
