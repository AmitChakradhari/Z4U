//
//  ImageListWireFrame.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

class ImageListWireFrame: ImageListWireFrameProtocol {
    
    static let rootStoryBoardName = "Main"
    static let navigationIdentifier = "NavigationController"
    
    func presentImageListScreen(from window: UIWindow) {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: ImageListWireFrame.navigationIdentifier) as? UINavigationController
        guard let navController = navigationController  else { return }
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: ImageListWireFrame.rootStoryBoardName, bundle: Bundle.main)
    }
}
