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
    var commitPredicate: NSPredicate?
    
    private let service: NetworkAdapter<MainEntity>
    
    init(service: NetworkAdapter<MainEntity> = NetworkAdapter()) {
        self.service = service
    }
    
    private func fetchReqHero(req: NSFetchRequest<HeroesEntity>) -> [HeroesEntity]? {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        do { return try managedContext.fetch(req) }
        catch let error {
            self.presenter?.errorMessage(msg: error.localizedDescription)
            return nil
        }
    }
    
    func loadHeroesByRole(role: String) {
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        fetchRequest.predicate = commitPredicate
        commitPredicate = NSPredicate(format: "roles CONTAINS[c] %@", role)
        presenter?.reloadHeroesByRole(hero: fetchReqHero(req: fetchRequest))
    }
    
    func loadAllHeroes() {
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        presenter?.reloadAllHeroes(hero: fetchReqHero(req: fetchRequest))
    }
    
    func loadRoles() -> [RolesEntity]? {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RolesEntity>(entityName: "RolesEntity")
        do { return try managedContext.fetch(fetchRequest) }
        catch let error {
            self.presenter?.errorMessage(msg: error.localizedDescription)
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
            self.presenter?.errorMessage(msg: err)
        }) { (Err) in
            self.presenter?.errorMessage(msg: "Failed")
        }
    }
}
