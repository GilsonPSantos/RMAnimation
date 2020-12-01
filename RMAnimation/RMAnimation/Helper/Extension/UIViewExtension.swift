//
//  UIViewExtension.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraint(to view: UIView? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, top: CGFloat? = nil, bottom: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let widthAnchor = width {
            self.widthAnchor.constraint(equalToConstant: widthAnchor).isActive = true
        }
        
        if let heightAnchor = height {
            self.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        }
        guard let superView = view else { return }
        if let leadingAnchor = leading {
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingAnchor).isActive = true
        }
        if let trailingAnchor = trailing {
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -trailingAnchor).isActive = true
        }
        if let topAnchor = top {
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: topAnchor).isActive = true
        }
        if let bottomAnchor = bottom {
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottomAnchor).isActive = true
        }
    }
    
    func addConstraint(to view: UIView? = nil, centerHorizontally: Bool = false, centerVertically: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if centerHorizontally {
            view?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
        if centerVertically {
            view?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
    }
}
