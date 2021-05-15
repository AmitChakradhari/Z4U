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
        interactor?.getImages(for: text)
    }
    
    func updateImageList(images: ImageList) {
        let imageObjectValues = images.query.pages.values
        let imageObjects: [ImageObject] = imageObjectValues.map { imageObject in
            return imageObject
        }
        view?.updateImageList(images: imageObjects)
    }
    
    func presentDetailScreen(for image: ImageObject) {
        
    }
    
}
