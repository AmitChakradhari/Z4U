//
//  ThumbnailModel+CoreDataProperties.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//
//

import Foundation
import CoreData


extension ThumbnailModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThumbnailModel> {
        return NSFetchRequest<ThumbnailModel>(entityName: "ThumbnailModel")
    }

    @NSManaged public var source: String?
    @NSManaged public var width: NSDecimalNumber?
    @NSManaged public var height: NSDecimalNumber?
    @NSManaged public var imageObject: ImageObjectModel?

}
