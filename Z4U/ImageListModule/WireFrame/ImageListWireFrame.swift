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
        guard let navController = navigationController, let imageListView = navController.children.first as? ImageListView  else { return }
        configureDependencies(for: imageListView)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    func configureDependencies(for view: ImageListView) {
        let presenter: ImageListPresenterProtocol = ImageListPresenter()
        let interactor: ImageListInteractorProtocol & ImageListResponseHandlerProtocol = ImageListInteractor()
        let remoteDataManager: ImageListRemoteDataManagerProtocol = ImageListRemoteDataManager()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = self
        
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteDataHandler = interactor
    }
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: ImageListWireFrame.rootStoryBoardName, bundle: Bundle.main)
    }
}
