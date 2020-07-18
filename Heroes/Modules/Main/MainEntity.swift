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
        roles.forEach { (role) in
            let roleEntity = RolesEntity(context: managedContext)
            roleEntity.name = role
            roleEntity.ofHeroes = HeroesEntity(context: managedContext)
            roleEntity.ofHeroes?.id = Int64(id ?? -1)
            roleEntity.ofHeroes?.name = name ?? "unknown"
            roleEntity.ofHeroes?.nickName = localizedName ?? "unknown"
            roleEntity.ofHeroes?.attr = primaryAttr ?? "unknown"
            roleEntity.ofHeroes?.type = attackType ?? "unknown"
            roleEntity.ofHeroes?.img = img ?? "unknown"
            roleEntity.ofHeroes?.icon = icon ?? "unknown"
            roleEntity.ofHeroes?.health = Int64(baseHealth ?? 0)
            roleEntity.ofHeroes?.mana = Int64(baseMana ?? 0)
            roleEntity.ofHeroes?.armor = baseArmor ?? 0.0
            roleEntity.ofHeroes?.atkMaks = Int64(baseAttackMax ?? 0)
            roleEntity.ofHeroes?.atkMin = Int64(baseAttackMin ?? 0)
            roleEntity.ofHeroes?.speed = Int64(moveSpeed ?? 0)
        }
        
        do { try managedContext.save() }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
