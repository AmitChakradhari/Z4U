//
//  ImageCell.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageCell: UICollectionViewCell {
    static let cellIdentifier = "cell"
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    func setContent(for object: ImageObject) {
        imageLabel.text = object.title
        guard let thumbnail = object.thumbnail, let url = URL(string: thumbnail.source) else { return }
        imageView?.af.setImage(withURL: url)
    }
    
    override func prepareForReuse() {
        imageLabel = nil
        imageView = nil
    }
}
