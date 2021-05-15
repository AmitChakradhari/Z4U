//
//  ImageObjectModel+CoreDataProperties.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageObjectModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageObjectModel> {
        return NSFetchRequest<ImageObjectModel>(entityName: "ImageObjectModel")
    }

    @NSManaged public var pageId: Int32
    @NSManaged public var title: String?
    @NSManaged public var thumbnail: ThumbnailModel?
    @NSManaged public var imageList: ImageListModel?
}
