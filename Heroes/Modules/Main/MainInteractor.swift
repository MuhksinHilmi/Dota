//
//  MainInteractor.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

/// Main Module Interactor
import CoreData

class MainInteractor: MainInteractorProtocol {
    var presenter: IMainProtocol?
    
    private let service: NetworkAdapter<MainEntity>
    
    init(service: NetworkAdapter<MainEntity> = NetworkAdapter()) {
        self.service = service
    }
    
    func loadHeroes() -> [HeroesEntity]? {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        do { return try managedContext.fetch(fetchRequest) }
        catch let error {
            print(error)
            return nil
        }
    }
    
    func loadRoles() -> [RolesEntity]? {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RolesEntity>(entityName: "RolesEntity")
        do { return try managedContext.fetch(fetchRequest) }
        catch let error {
            print(error)
            return nil
        }
    }
    
    func fetchAPI() {
        service.request(service: .heroes, success: { (data) in
            if let dataModel = data {
                dataModel.forEach { (entity) in
                    entity?.saveHeroes()
                    self.presenter?.reloadHeroes()
                }
            }
        }, error: { (err) in
            print(err)
        }) { (Err) in
            print("Failed")
        }
    }
}
