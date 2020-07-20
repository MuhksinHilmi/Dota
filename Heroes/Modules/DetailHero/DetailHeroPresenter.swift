//
//  DetailHeroPresenter.swift
//  Heroes
//
//  Created Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// DetailHero Module Presenter
class DetailHeroPresenter {
    
    weak private var view: DetailHeroViewProtocol?
    private var interactor: DetailHeroInteractorProtocol
    private var wireframe: DetailHeroRouterProtocol
    var heroDetail: HeroesEntity?
    
    init(view: DetailHeroViewProtocol, interactor: DetailHeroInteractorProtocol, router: DetailHeroRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = router
        self.wireframe.viewController = view as? UIViewController
        self.interactor.presenter = self
    }
}

extension DetailHeroPresenter: DetailHeroPresenterProtocol {
    func loadSimilarHero() {
        if let name = heroDetail?.nickName, let roles = heroDetail?.roleArray, let attr = heroDetail?.attr {
            interactor.loadHeroesBy(name: name, roles: roles, attr: attr)
        }
    }
}

extension DetailHeroPresenter: IDetailHeroProtocol {
    func reloadHeroesByRoleAttr(hero: [HeroesEntity]?) {
        view?.getDataHeroes(heroes: hero)
    }
    func errorMessage(msg: String) {
        print(msg)
    }
}
