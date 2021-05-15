//
//  ImageListInteractor.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation

class ImageListInteractor: ImageListInteractorProtocol {
    weak var presenter: ImageListPresenterProtocol?
    var remoteDataManager: ImageListRemoteDataManagerProtocol? = ImageListRemoteDataManager()
        
    func getImages(for text: String) {
        remoteDataManager?.retrieveImageList(for: text)
    }
}

extension ImageListInteractor: ImageListResponseHandlerProtocol {
    func onRetrievedImages(_ images: ImageList) {
        presenter?.updateImageList(images: images)
    }
}
