//
//  RolesEntity+CoreDataProperties.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//
//

import Foundation
import CoreData


extension RolesEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RolesEntity> {
        return NSFetchRequest<RolesEntity>(entityName: "RolesEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var ofHeroes: HeroesEntity?

    public var wrappedName: String {
        name ?? ""
    }
}
