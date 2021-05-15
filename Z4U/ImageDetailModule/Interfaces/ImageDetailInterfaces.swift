//
//  ImageDetailInterfaces.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

protocol ImageDetailWireFrameProtocol: class {
    static func prepareImageDetailModule() -> ImageDetailView?
}

protocol ImageDetailViewProtocol: class {
    var presenter:ImageDetailPresenterProtocol? {get set}
    // PRESENTER -> VIEW
    func updateImageDetail(with imageDetail: ImageObject)
}
protocol ImageDetailPresenterProtocol: class {
    var view: ImageDetailViewProtocol? {get set}
    var imageDetail: ImageObject? {get set}
    // VIEW -> PRESENTER
    func viewDidLoad()
}
