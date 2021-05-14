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
    static let imageListViewIdentifier = "ImageListVC"
    static let navigationIdentifier = "NC"
    
    func presentImageListScreen(from window: UIWindow) {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: ImageListWireFrame.navigationIdentifier) as? UINavigationController
        let imageListController = listViewControllerFromStoryboard()
        imageListController.view.backgroundColor = .systemBlue
        guard let navController = navigationController  else { return }
        //navController.viewControllers = [imageListController]
        window.rootViewController = navController
        window.makeKeyAndVisible()
        print("isKeyWindow: \(window.isKeyWindow), bc: \(window.rootViewController?.children.first?.view.backgroundColor)")
    }
    
    func listViewControllerFromStoryboard() -> UIViewController {
        let storyboard = mainStoryboard
        let viewController = storyboard.instantiateViewController(withIdentifier: ImageListWireFrame.imageListViewIdentifier) as! UIViewController
        return viewController
    }
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: ImageListWireFrame.rootStoryBoardName, bundle: Bundle.main)
    }
}
