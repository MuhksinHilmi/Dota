//
//  MainRouter.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// Main Module Router (aka: Wireframe)
class MainRouter: MainRouterProtocol {
    var viewController: UIViewController?
    
    func goToDetailHero(heroEntity: HeroesEntity) {
        let controller = DetailHeroModule()
        controller.presenter.heroDetail = heroEntity
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
