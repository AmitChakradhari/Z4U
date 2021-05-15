//
//  ImageListModel+CoreDataProperties.swift
//  Z4U
//
//  Created by Amit  Chakradhari on 15/05/21.
//  Copyright © 2021 Amit  Chakradhari. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageListModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageListModel> {
        return NSFetchRequest<ImageListModel>(entityName: "ImageListModel")
    }

    @NSManaged public var searchText: String?
    @NSManaged public var objects: NSOrderedSet?

}

// MARK: Generated accessors for objects
extension ImageListModel {

    @objc(insertObject:inObjectsAtIndex:)
    @NSManaged public func insertIntoObjects(_ value: ImageObjectModel, at idx: Int)

    @objc(removeObjectFromObjectsAtIndex:)
    @NSManaged public func removeFromObjects(at idx: Int)

    @objc(insertObjects:atIndexes:)
    @NSManaged public func insertIntoObjects(_ values: [ImageObjectModel], at indexes: NSIndexSet)

    @objc(removeObjectsAtIndexes:)
    @NSManaged public func removeFromObjects(at indexes: NSIndexSet)

    @objc(replaceObjectInObjectsAtIndex:withObject:)
    @NSManaged public func replaceObjects(at idx: Int, with value: ImageObjectModel)

    @objc(replaceObjectsAtIndexes:withObjects:)
    @NSManaged public func replaceObjects(at indexes: NSIndexSet, with values: [ImageObjectModel])

    @objc(addObjectsObject:)
    @NSManaged public func addToObjects(_ value: ImageObjectModel)

    @objc(removeObjectsObject:)
    @NSManaged public func removeFromObjects(_ value: ImageObjectModel)

    @objc(addObjects:)
    @NSManaged public func addToObjects(_ values: NSOrderedSet)

    @objc(removeObjects:)
    @NSManaged public func removeFromObjects(_ values: NSOrderedSet)

}
