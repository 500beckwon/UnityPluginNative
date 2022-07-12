//
//  TabBarController.swift
//  UnityPluginNative
//
//  Created by ByungHoon Ann on 2022/07/12.
//

import UIKit

final class TabBarController: UITabBarController {
    var unityNavigationController: UnityViewController?
    override func viewDidLoad() {
        UnityEmbeddedSwift.showUnity()
        
        guard let unityViewController = UnityEmbeddedSwift.getUnityRootViewController() else { return }
        let firstNC = UINavigationController(rootViewController: ViewController())
        let secondNC = UINavigationController(rootViewController: unityViewController)
        unityNavigationController = UnityViewController(navigationController: secondNC)
        viewControllers = [firstNC, secondNC]
        
    }
}
