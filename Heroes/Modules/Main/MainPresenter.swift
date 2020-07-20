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
    var getRoles: [String]?
    
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
        getRoles = listOfRole
        getRoles?.append("All")
        view?.reloadRole()
    }
}

extension MainPresenter: MainPresenterProtocol {
    func fetchData() {
        interactor.loadAllHeroes()
    }
    func fetchDataByRole(role: String) {
        interactor.loadHeroesByRole(role: role == "All" ? "" : role)
        view?.setTitle(title: role)
    }
    func goToDetailHero(heroEntity: HeroesEntity) {
        wireframe.goToDetailHero(heroEntity: heroEntity)
    }
}

extension MainPresenter: IMainProtocol {
    func reloadAllHeroes(hero: [HeroesEntity]?) {
        if hero?.count ?? 0 > 0 {
            view?.getDataHeroes(heroes: hero)
            getDataRoles(loadData: hero)
        } else {
            interactor.fetchAPI()
        }
    }
    func reloadHeroesByRole(hero: [HeroesEntity]?) {
        view?.getDataHeroes(heroes: hero)
    }
    func reloadHeroes() {
        interactor.loadAllHeroes()
    }
    
    func errorMessage(msg: String) {
        view?.handleError(err: msg)
    }
}
