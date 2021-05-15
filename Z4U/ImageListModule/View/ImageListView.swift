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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

extension ImageListView: ImageListViewProtocol {
    
    func updateImageList(images: [ImageObject]) {
        imageList = images
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

extension ImageListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let deviceWidth = collectionView.frame.width
        var prefferedSize: CGFloat
        if deviceWidth <= 400 {
            prefferedSize = (deviceWidth - 20)/2
            return CGSize(width: prefferedSize, height: prefferedSize)
        } else {
            return CGSize(width: 200, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageObject = imageList[indexPath.row]
        presenter?.presentDetailScreen(from: self, for: imageObject)
    }
}
