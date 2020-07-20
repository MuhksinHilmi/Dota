//
//  MainTests.swift
//  HeroesTests
//
//  Created by Muhksin Hilmi on 19/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import XCTest
import CoreData
@testable import Heroes

class MainTests: XCTestCase {
    var presenter: MainPresenterProtocol!
    var vPresenter: TestMainView!
    var interactor: TestMainInteractor!
    var wireframe: TestMainRouter!
    var mockData: MockData!
    
    override func setUp() {
        interactor = TestMainInteractor()
        interactor.mockData = mockData
        wireframe = TestMainRouter()
        wireframe.mockData = mockData
        vPresenter = TestMainView()
        presenter = MainPresenter(view: vPresenter, interactor: interactor, router: wireframe)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadData() {
        let testExpectation = expectation(description: #function)
        presenter.fetchData()
        XCTAssertTrue(interactor.isLoadAllHeroes)
        if interactor.haveDataLocal {
            XCTAssertTrue(vPresenter.haveDataLocal)
            XCTAssertTrue(vPresenter.reloadData)
        }else {
            XCTAssertTrue(interactor.isfetchAPI)
        }
        testExpectation.fulfill()
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class TestMainView: MainViewProtocol {
    var haveDataLocal: Bool = false
    var reloadData: Bool = false
    func getDataHeroes(heroes: [HeroesEntity]?) {
        haveDataLocal = true
    }
    
    func reloadRole() {
        reloadData = true
    }
    
    func handleError(err: String) {
        
    }
}

class TestMainInteractor: MainInteractorProtocol {
    var presenter: IMainProtocol?
    var mockData: MockData!
    var haveDataLocal: Bool = false
    var isLoadAllHeroes: Bool = false
    var isfetchAPI: Bool = false
    
    private func fetchReqHero(req: NSFetchRequest<HeroesEntity>) -> [HeroesEntity]? {
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        do { return try managedContext.fetch(req) }
        catch let error {
            self.presenter?.errorMessage(msg: error.localizedDescription)
            return nil
        }
    }
    
    func loadHeroesByRole(role: String) {
        
    }
    
    func loadAllHeroes() {
        isLoadAllHeroes = true
        let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
        if let localData = fetchReqHero(req: fetchRequest) {
            haveDataLocal = localData.count > 0
            presenter?.reloadAllHeroes(hero: localData)
        }
    }
    
    func fetchAPI() {
        isfetchAPI = true
    }
}

class TestMainRouter: MainRouterProtocol {
    var viewController: UIViewController?
    var mockData: MockData!
}
