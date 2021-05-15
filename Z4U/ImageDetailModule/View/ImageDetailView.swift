//
//  ImageDetailView.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageDetailView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var presenter: ImageDetailPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.setNeedsLayout()
    }
}

extension ImageDetailView: ImageDetailViewProtocol {
    
    func updateImageDetail(with imageDetail: ImageObject) {
        if let thumbnail = imageDetail.thumbnail, let imageURL = URL(string: thumbnail.source) {
            imageView.af.setImage(withURL: imageURL)
        }
    }
    
}
