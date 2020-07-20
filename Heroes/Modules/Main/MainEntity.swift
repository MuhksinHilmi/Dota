//
//  MainEntity.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit
import CoreData

/// Main Module Entity
struct MainEntity: Codable {
    var id: Int?
    var name: String?
    var localizedName:String?
    var primaryAttr: String?
    var attackType: String?
    var roles: [String]
    var img: String?
    var icon: String?
    var baseHealth: Int?
    var baseMana: Int?
    var baseArmor: Double?
    var baseAttackMin: Int?
    var baseAttackMax: Int?
    var moveSpeed: Int?
    
    func saveHeroes() {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
         let heroesEntity = HeroesEntity(context: managedContext)
         roles.forEach { (role) in
            let rolesEntity = RolesEntity(context: managedContext)
             rolesEntity.name = role
             heroesEntity.addToRoles(rolesEntity)
         }
         heroesEntity.id = Int64(id ?? -1)
         heroesEntity.name = name ?? "unknown"
         heroesEntity.nickName = localizedName ?? "unknown"
         heroesEntity.attr = primaryAttr ?? "unknown"
         heroesEntity.type = attackType ?? "unknown"
         heroesEntity.img = img ?? "unknown"
         heroesEntity.icon = icon ?? ""
         heroesEntity.health = Int64(baseHealth ?? 0)
         heroesEntity.mana = Int64(baseMana ?? 0)
         heroesEntity.armor = baseArmor ?? 0.0
         heroesEntity.atkMaks = Int64(baseAttackMax ?? 0)
         heroesEntity.atkMin = Int64(baseAttackMin ?? 0)
         heroesEntity.speed = Int64(moveSpeed ?? 0)
         
        do { try managedContext.save() }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
