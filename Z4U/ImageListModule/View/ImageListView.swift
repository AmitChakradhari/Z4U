//
//  ViewController.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 13/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import UIKit

class ImageListView: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageList: [ImageObject] = []
    var presenter: ImageListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ImageListView: ImageListViewProtocol {
    
    func updateImageList(images: [ImageObject]) {
        imageList = images
        print(imageList, "network response, 32")
        collectionView.reloadData()
    }
}

extension ImageListView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text,
            !text.isEmpty && text.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {return}
        presenter?.getImages(for: text)
    }
}

extension ImageListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.cellIdentifier, for: indexPath) as? ImageCell else {
            fatalError("could not create cell")
        }
        let imageInfo = imageList[indexPath.row]
        cell.setContent(for: imageInfo)
        return cell
    }
}
