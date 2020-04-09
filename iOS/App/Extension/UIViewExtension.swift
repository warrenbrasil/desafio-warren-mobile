//
//  UIViewExtension.swift
//  App
//
//  Created by Alessandro Garcez on 08/04/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

extension UIView {
    
    func setRadius(value: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = value
    }
    
    func clipAsCircle() {
        setRadius(value: self.frame.width / 2)
    }
    
    @discardableResult func insertArrangedSubview(_ view: UIView,
                                                  edgeInsets: UIEdgeInsets = .zero,
                                                  sendToBack: Bool = false) -> EdgeConstraintSet {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        if sendToBack { sendSubviewToBack(view) }
        return EdgeConstraintSet(parentView: self, subview: view, edgeInsets: edgeInsets)
    }
    
}

struct EdgeConstraintSet {
    
    let top: NSLayoutConstraint
    let right: NSLayoutConstraint
    let bottom: NSLayoutConstraint
    let left: NSLayoutConstraint
    
    init(parentView: UIView, subview: UIView, edgeInsets: UIEdgeInsets) {
        top = subview.topAnchor.constraint(equalTo: parentView.topAnchor, constant: edgeInsets.top)
        right = subview.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -edgeInsets.right)
        bottom = subview.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -edgeInsets.bottom)
        left = subview.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: edgeInsets.left)
        activate()
    }
    
    private func activate() {
        top.isActive = true
        right.isActive = true
        bottom.isActive = true
        left.isActive = true
    }
}
