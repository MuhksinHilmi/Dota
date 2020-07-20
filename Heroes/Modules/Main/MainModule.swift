//
//  MainModule.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// Main Module View
class MainModule: UIViewController {
    
    private var presenter: MainPresenterProtocol!
    lazy var mainView: MainView = {
        guard let view = view as? MainView else { return MainView()}
        return view
    }()
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        presenter = MainPresenter(
            view: self,
            interactor: MainInteractor(),
            router: MainRouter()
        )
    }
    
    override func loadView() {
        let thisView = MainView()
        thisView.presenter = presenter
        view = thisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchData()
        setTitle(title: "All")
    }
    
    func setTitle(title: String) {
        self.title = title
    }
}

// MARK: - extending MainView to implement it's protocol
extension MainModule: MainViewProtocol {
    func reloadRole() {
        DispatchQueue.main.async {
            self.mainView.reloadDataRoles()
        }
    }
    
    func getDataHeroes(heroes: [HeroesEntity]?) {
       DispatchQueue.main.async {
           self.mainView.setDataHeroes(heroes: heroes)
       }
    }
    func handleError(err: String) {
        DispatchQueue.main.async {
            self.mainView.errorLabel.text = err
        }
    }
}
