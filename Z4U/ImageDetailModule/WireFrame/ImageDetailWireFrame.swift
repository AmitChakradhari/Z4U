//
//  ImageDetailWireFrame.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

class ImageDetailWireFrame: ImageDetailWireFrameProtocol {
    static let imageDetailIdentifier = "ImageDetail"
    static func prepareImageDetailModule() -> ImageDetailView? {
        let view = ImageListWireFrame.mainStoryboard.instantiateViewController(withIdentifier: ImageDetailWireFrame.imageDetailIdentifier) as? ImageDetailView
        
        let presenter: ImageDetailPresenterProtocol = ImageDetailPresenter()
        
        view?.presenter = presenter
        presenter.view = view
        
        return view
    }
}
