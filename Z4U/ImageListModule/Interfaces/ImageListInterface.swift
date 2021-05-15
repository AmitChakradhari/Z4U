//
//  ImageListInterface.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

//typealias imageResponse = [String: [ImageObject]]

protocol ImageListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    func presentImageListScreen(from window: UIWindow)
    func presentImageDetailScreen(from view: ImageListViewProtocol, for object: ImageObject)
}

protocol ImageListInteractorProtocol: class {
    var presenter: ImageListPresenterProtocol? { get set }
    var remoteDataManager: ImageListRemoteDataManagerProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func getImages(for text: String)
}

protocol ImageListPresenterProtocol: class {
    var view: ImageListViewProtocol? {get set}
    var interactor: ImageListInteractorProtocol? {get set}
    var wireframe: ImageListWireFrameProtocol? {get set}
    // VIEW -> PRESENTER
    func getImages(for text: String)
    // PRESENTER -> VIEW
    func updateImageList(images: ImageList)
    // VIEW -> PRESENTER
    func presentDetailScreen(from view: ImageListViewProtocol, for image: ImageObject)
}

protocol ImageListRemoteDataManagerProtocol: class {
    var remoteDataHandler: ImageListResponseHandlerProtocol? {get set} // unowned or weak
    func retrieveImageList(for text: String)
}

protocol ImageListResponseHandlerProtocol: class {
    // DATA MANAGER -> INTERACTOR
    func onRetrievedImages(_ images: ImageList)
}

protocol ImageListViewProtocol: class {
    var presenter: ImageListPresenterProtocol? {get set}
    // PRESENTER -> VIEW
    func updateImageList(images: [ImageObject])
}
