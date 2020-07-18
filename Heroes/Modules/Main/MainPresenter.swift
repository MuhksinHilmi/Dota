//
//  MainPresenter.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// Main Module Presenter
class MainPresenter {
    
    weak private var view: MainViewProtocol?
    private var interactor: MainInteractorProtocol
    private var wireframe: MainRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = router
        self.wireframe.viewController = view as? UIViewController
        self.interactor.presenter = self
    }
    
    func getDataRoles(loadData: [HeroesEntity]?) {
        var listOfRole: [String] = []
        loadData?.forEach({ (entity) in
            let arr = entity.roleArray
            arr.forEach { (role) in
                
                if !listOfRole.contains(role.wrappedName) {
                    listOfRole.append(role.wrappedName)
                }
            }
        })
        view?.getRoles(roles: listOfRole)
    }
}

extension MainPresenter: MainPresenterProtocol {
    func fetchData() {
        let loadData = interactor.loadHeroes()
        if loadData?.count ?? 0 > 0 {
            view?.getDataHeroes(heroes: loadData)
            getDataRoles(loadData: loadData)
        } else {
            interactor.fetchAPI()
        }
    }
}

extension MainPresenter: IMainProtocol {
    func reloadHeroes() {
        let loadData = interactor.loadHeroes()
        getDataRoles(loadData: loadData)
        view?.getDataHeroes(heroes: loadData)
    }
}
