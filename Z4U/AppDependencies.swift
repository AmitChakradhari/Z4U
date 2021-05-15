//
//  AppDependencies.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

class AppDependencies {
    let imageListWireFrame = ImageListWireFrame()
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        imageListWireFrame.presentImageListScreen(from: window)
    }
}
