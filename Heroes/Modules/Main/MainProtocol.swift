//
//  MainProtocol.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

//MARK: View to Presenter
protocol MainPresenterProtocol: class {
    var getRoles: [String]? {get set}
    func fetchData()
    func fetchDataByRole(role: String)
    func goToDetailHero(heroEntity: HeroesEntity)
}

//MARK: Presenter to Interactor
protocol MainInteractorProtocol: class {
    var presenter: IMainProtocol? {get set}
    func loadHeroesByRole(role: String)
    func loadAllHeroes()
    func fetchAPI()
}

//MARK: Interactor to Presenter
protocol IMainProtocol: class {
    func reloadHeroesByRole(hero: [HeroesEntity]?)
    func reloadAllHeroes(hero: [HeroesEntity]?)
    func reloadHeroes()
    func errorMessage(msg: String)
}

//MARK: Presenter to View
protocol MainViewProtocol: class {
    func getDataHeroes(heroes: [HeroesEntity]?)
    func reloadRole()
    func handleError(err: String)
    func setTitle(title: String)
}

//MARK: Presenter to Router (aka: Wireframe) -
protocol MainRouterProtocol {
    var viewController: UIViewController? {get set}
    func goToDetailHero(heroEntity: HeroesEntity)
}
