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
        if !role.isEmpty {
            commitPredicate = NSPredicate(format: "roles.name CONTAINS[c] %@", role)
            fetchRequest.predicate = commitPredicate
        }
        fetchRequest.returnsDistinctResults = true
        presenter?.reloadHeroesByRole(hero: fetchReqHero(req: fetchRequest))
    }
    
    func loadAllHeroes() {
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        fetchRequest.returnsDistinctResults = true
        presenter?.reloadAllHeroes(hero: fetchReqHero(req: fetchRequest))
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
