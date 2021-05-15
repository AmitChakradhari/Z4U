//
//  ImageListLocalDataManager.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//

import Foundation
import CoreData

class ImageListLocalDataManager: ImageListLocalDataManagerProtocol {
    
    func retrieveImageList(for searchText: String) throws -> [ImageObject] {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request: NSFetchRequest<ImageListModel> = NSFetchRequest(entityName: String(describing: ImageListModel.self))
        
        do {
            let imageListModel = try managedOC.fetch(request)
            if let prefferedModel = imageListModel.filter({ model in
                return model.searchText == searchText
            }).first, let imageObjectModels = prefferedModel.objects?.array as? [ImageObjectModel] {
                let imageObjects: [ImageObject] = imageObjectModels.map { imageObjectModel in
                    return ImageObject(pageid: Int(imageObjectModel.pageId),
                                       title: imageObjectModel.title ?? "",
                                       thumbnail: ImageInfo(
                                        source: imageObjectModel.thumbnail?.source ?? "",
                                        width: Int(truncating: imageObjectModel.thumbnail?.width ?? 0),
                                        height: Int(truncating: imageObjectModel.thumbnail?.height ?? 0)))
                }
                return imageObjects
            }
            return []
        } catch {
            throw PersistenceError.objectNotFound
        }
    }
    
    func saveImageList(for searchText: String, object: [ImageObject]) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        if let newImageListModel = NSEntityDescription.entity(forEntityName: "ImageListModel",
                                                    in: managedOC) {
            let imageListModel = ImageListModel(entity: newImageListModel, insertInto: managedOC)
            imageListModel.searchText = searchText
            for imageObject in object {
                guard let newImageObject = NSEntityDescription.entity(forEntityName: "ImageObjectModel", in: managedOC),
                    let newThumbnailObject = NSEntityDescription.entity(forEntityName: "ThumbnailModel", in: managedOC) else { continue }
                let imgObject = ImageObjectModel(entity: newImageObject, insertInto: managedOC)
                
                let thumbnailObject = ThumbnailModel(entity: newThumbnailObject, insertInto: managedOC)
                thumbnailObject.height = NSDecimalNumber(value: imageObject.thumbnail?.height ?? 0)
                thumbnailObject.width = NSDecimalNumber(value: imageObject.thumbnail?.width ?? 0)
                thumbnailObject.source = imageObject.thumbnail?.source
                imgObject.pageId = Int32(imageObject.pageid)
                imgObject.title = imageObject.title
                imgObject.thumbnail = thumbnailObject
                
                imageListModel.addToObjects(imgObject)
            }
            do {
                try managedOC.save()
            } catch {
                print(error, "error")
            }
        }
    }
}
