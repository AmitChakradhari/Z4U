//
//  ImageDetailPresenter.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation

class ImageDetailPresenter: ImageDetailPresenterProtocol {
    weak var view: ImageDetailViewProtocol?
    
    var imageDetail: ImageObject?
    
    func viewDidLoad() {
        guard let detail = imageDetail else { return }
        view?.updateImageDetail(with: detail)
    }
}
