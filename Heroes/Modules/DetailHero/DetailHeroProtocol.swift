//
//  DetailHeroProtocol.swift
//  Heroes
//
//  Created Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

//MARK: View to Presenter
protocol DetailHeroPresenterProtocol: class {
    var heroDetail: HeroesEntity? {get set}
    func loadSimilarHero()
}

//MARK: Presenter to Interactor
protocol DetailHeroInteractorProtocol: class {
    var presenter:IDetailHeroProtocol? {get set}
    func loadHeroesBy(name: String, roles: [RolesEntity], attr: String)
}

//MARK: Interactor to Presenter
protocol IDetailHeroProtocol: class {
    func reloadHeroesByRoleAttr(hero: [HeroesEntity]?)
    func errorMessage(msg: String)
}

//MARK: Presenter to View
protocol DetailHeroViewProtocol: class {
   func getDataHeroes(heroes: [HeroesEntity]?)
}

//MARK: Presenter to Router (aka: Wireframe) -
protocol DetailHeroRouterProtocol {
    var viewController: UIViewController? {get set}
}
