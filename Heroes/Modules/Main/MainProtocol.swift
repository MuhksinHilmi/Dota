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
    func fetchData()
}

//MARK: Presenter to Interactor
protocol MainInteractorProtocol: class {
    var presenter:IMainProtocol? {get set}
    func loadRoles() -> [RolesEntity]?
    func loadHeroes() -> [HeroesEntity]?
    func fetchAPI()
}

//MARK: Interactor to Presenter
protocol IMainProtocol: class {
    func reloadHeroes()
}

//MARK: Presenter to View
protocol MainViewProtocol: class {
    func getDataHeroes(heroes: [HeroesEntity]?)
    func getRoles(roles: [String])
}

//MARK: Presenter to Router (aka: Wireframe) -
protocol MainRouterProtocol {
    var viewController: UIViewController? {get set}
}
