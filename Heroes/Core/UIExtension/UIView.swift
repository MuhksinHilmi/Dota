//
//  UIView.swift
//  Heroes
//
//  Created by Muhksin Hilmi on 18/07/2020.
//  Copyright © 2020 LevUp. All rights reserved.
//

import UIKit
public enum Spacer {
    case first, last
}

public enum ViewSafeArea {
    case top, leading, trailing, bottom, vertical, horizontal, all, none, height(size: CGFloat)
}

extension UIView {
    fileprivate func stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, addShadow: Bool = false) ->  UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        if addShadow {
            layer.backgroundColor = UIColor.clear.cgColor
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2.5)
            layer.shadowOpacity = 0.2
            layer.shadowRadius = 4.0
        }
        addSubview(stackView)
        stackView.edgeTo(self)
        return stackView
    }
    
    @discardableResult
    open func vStack(views: UIView..., spacers: [Spacer] = [], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, addShadow: Bool = false) -> UIStackView {
        let customView = customSpacer(views: views, spacers: spacers)
        return stack(.vertical, views: customView, spacing: spacing, alignment: alignment, distribution: distribution, addShadow: addShadow)
    }
    
    @discardableResult
    open func vStack(views: [UIView], spacers: [Spacer] = [], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, addShadow: Bool = false) -> UIStackView {
        let customView = customSpacer(views: views, spacers: spacers)
        return stack(.vertical, views: customView, spacing: spacing, alignment: alignment, distribution: distribution, addShadow: addShadow)
    }
    
    @discardableResult
    open func hStack(views: UIView..., spacers: [Spacer] = [], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, addShadow: Bool = false) -> UIStackView {
        return hStack(views: views, spacers: spacers, spacing: spacing, alignment: alignment, distribution: distribution, addShadow: addShadow)
    }
    
    @discardableResult
    open func hStack(views: [UIView], spacers: [Spacer] = [], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, addShadow: Bool = false) -> UIStackView {
        let customView = customSpacer(views: views, spacers: spacers)
        return stack(.horizontal, views: customView, spacing: spacing, alignment: alignment, distribution: distribution, addShadow: addShadow)
    }
    
    fileprivate func customSpacer(views: [UIView], spacers: [Spacer]) -> [UIView] {
        var customView = views
        spacers.forEach { (spacer) in
            switch spacer {
            case .first:
                customView.insert(UIView(), at: customView.startIndex)
            case .last:
                customView.insert(UIView(), at: customView.endIndex)
            }
        }
        return customView
    }
    
    @discardableResult
    public func edgeTo(_ view: UIView, safeArea: ViewSafeArea = .none) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch safeArea {
        case .top:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .leading:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .trailing:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .bottom:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .vertical:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .horizontal:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .all:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .none:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .height(let size):
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            heightAnchor.constraint(equalToConstant: size).isActive = true
        }
        return self
    }
    
    @discardableResult
    open func setFrame(_ size: CGSize) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self
    }
    
    @discardableResult
    open func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}
