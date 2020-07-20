//
//  DetailHeroInteractor.swift
//  Heroes
//
//  Created Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//
import CoreData

/// DetailHero Module Interactor
class DetailHeroInteractor: DetailHeroInteractorProtocol {
    var presenter: IDetailHeroProtocol?
    var commitPredicate: NSPredicate?
    private let service: NetworkAdapter<DetailHeroEntity>
    
    init(service: NetworkAdapter<DetailHeroEntity> = NetworkAdapter()) {
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
    
    func loadHeroesBy(name: String, roles: [RolesEntity], attr: String) {
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        var query: String = ""
        roles.enumerated().forEach { (index,role) in
            query.append("\(index > 0 ? " OR " : "")(roles.name CONTAINS[c] '\(role.name ?? "")')")
        }
        commitPredicate = NSPredicate(format: "(NOT nickName BEGINSWITH '\(name)') AND (\(query)) AND (attr CONTAINS[c] %@)", attr)
        fetchRequest.predicate = commitPredicate
        fetchRequest.fetchLimit = 3
        
        fetchRequest.returnsDistinctResults = true
        presenter?.reloadHeroesByRoleAttr(hero: fetchReqHero(req: fetchRequest))
    }
}
