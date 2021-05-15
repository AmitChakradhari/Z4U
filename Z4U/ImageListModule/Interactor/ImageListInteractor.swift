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
    var localDataManager: ImageListLocalDataManagerProtocol?
    var remoteDataManager: ImageListRemoteDataManagerProtocol? = ImageListRemoteDataManager()
        
    func getImages(for text: String) {
        do {
            if let imageObjects = try localDataManager?.retrieveImageList(for: text), imageObjects.count > 0 {
                presenter?.view?.updateImageList(images: imageObjects)
                presenter?.view?.hideLoading()
            } else {
                remoteDataManager?.retrieveImageList(for: text)
            }
        } catch (let error) {
            print(error, "error occurred while retrieving from core data")
        }
    }
}

extension ImageListInteractor: ImageListResponseHandlerProtocol {
    
    func onRetrievedImages(images: ImageList, for text: String) {
        presenter?.updateImageList(images: images)
        let imageObjectValues = images.query.pages.values
        let imageObjects: [ImageObject] = imageObjectValues.filter { imageObject in
            return imageObject.thumbnail != nil
        }
        do {
            try localDataManager?.saveImageList(for: text, object: imageObjects)
        } catch (let error) {
            print(error, "error in saving to core data")
        }
    }
    
    func onRecievingError() {
        presenter?.view?.hideLoading()
        presenter?.view?.showError(with: "no results found")
    }
}
