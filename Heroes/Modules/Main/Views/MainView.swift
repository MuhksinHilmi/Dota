//
//  MainView.swift
//  Heroes
//
//  Created Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 Tutore. All rights reserved.
//

import UIKit

/// Main Module View
class MainView: UIView {
    
    var presenter: MainPresenterProtocol!
    var container: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(container)
        container.edgeTo(self, safeArea: .all)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
