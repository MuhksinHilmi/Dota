//
//  HeroesEntity+CoreDataProperties.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//
//

import Foundation
import CoreData


extension HeroesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeroesEntity> {
        return NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
    }

    @NSManaged public var armor: Double
    @NSManaged public var atkMaks: Int64
    @NSManaged public var atkMin: Int64
    @NSManaged public var attr: String?
    @NSManaged public var health: Int64
    @NSManaged public var icon: String?
    @NSManaged public var id: Int64
    @NSManaged public var img: String?
    @NSManaged public var mana: Int64
    @NSManaged public var name: String?
    @NSManaged public var nickName: String?
    @NSManaged public var speed: Int64
    @NSManaged public var type: String?
    @NSManaged public var roles: NSSet?

    public var roleArray: [RolesEntity] {
        let set = roles as? Set<RolesEntity> ?? []
        return set.sorted{
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for roles
extension HeroesEntity {

    @objc(addRolesObject:)
    @NSManaged public func addToRoles(_ value: RolesEntity)

    @objc(removeRolesObject:)
    @NSManaged public func removeFromRoles(_ value: RolesEntity)

    @objc(addRoles:)
    @NSManaged public func addToRoles(_ values: NSSet)

    @objc(removeRoles:)
    @NSManaged public func removeFromRoles(_ values: NSSet)

}
