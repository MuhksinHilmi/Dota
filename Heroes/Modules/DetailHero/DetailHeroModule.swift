//
//  DetailHeroModule.swift
//  Heroes
//
//  Created Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// DetailHero Module View
class DetailHeroModule: UIViewController {
    var presenter: DetailHeroPresenterProtocol!
    lazy var detailHeroView: DetailHeroView = {
        guard let view = view as? DetailHeroView else { return DetailHeroView()}
        return view
    }()
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        presenter = DetailHeroPresenter(
            view: self,
            interactor: DetailHeroInteractor(),
            router: DetailHeroRouter()
        )
    }
    
    override func loadView() {
        let thisView = DetailHeroView()
        thisView.presenter = presenter
        view = thisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let heroDetail = presenter.heroDetail {
            presenter.loadSimilarHero()
            detailHeroView.profileHeroView.setProfile(hero: heroDetail)
            detailHeroView.setStatusHero(stat: [.attack(val: "\(heroDetail.atkMin) - \(heroDetail.atkMaks)"),
                                                .health(val: String(heroDetail.health)),
                                                .armor(val: String(heroDetail.armor)),
                                                .mana(val: String(heroDetail.mana)),
                                                .speed(val: String(heroDetail.speed)),
                                                .attr(val: heroDetail.attr ?? "Unknown")])
        }
    }
}

// MARK: - extending DetailHeroView to implement it's protocol
extension DetailHeroModule: DetailHeroViewProtocol {
    func getDataHeroes(heroes: [HeroesEntity]?) {
        if let heroes = heroes {
            detailHeroView.similarHeroView.setSimilarHeroData(heroes: heroes)
        }
    }
}
