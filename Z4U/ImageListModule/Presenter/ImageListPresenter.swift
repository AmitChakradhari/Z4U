//
//  ImageListPresenter.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 14/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation

class ImageListPresenter: ImageListPresenterProtocol {
    
    var view: ImageListViewProtocol?
    
    var interactor: ImageListInteractorProtocol?
    
    var wireframe: ImageListWireFrameProtocol?
    
    func getImages(for text: String) {
        view?.showLoading()
        interactor?.getImages(for: text)
    }
    
    func updateImageList(images: ImageList) {
        let imageObjectValues = images.query.pages.values
        let imageObjects: [ImageObject] = imageObjectValues.filter { imageObject in
            return imageObject.thumbnail != nil
        }
        view?.updateImageList(images: imageObjects)
        view?.hideLoading()
    }
    
    func presentDetailScreen(from view: ImageListViewProtocol,for image: ImageObject) {
        wireframe?.presentImageDetailScreen(from: view, for: image)
    }
}
