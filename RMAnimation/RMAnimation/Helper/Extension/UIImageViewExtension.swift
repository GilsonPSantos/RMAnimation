//
//  UIImageViewExtension.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(urlString: String, keyImage: String, imageDefaultName: String = "") {
        if let imageCache = UserDefaultHelper.shared.getImage(key: keyImage) {
            self.image = UIImage(data: imageCache)
            return
        }
        guard let url = URL(string: urlString) else { self.setImageDefaultOrCache(with: imageDefaultName, key: keyImage); return }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                UserDefaultHelper.shared.saveImage(data: data, key: keyImage)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } catch {
                self.setImageDefaultOrCache(with: imageDefaultName, key: keyImage)
            }
        }
    }
    
    func setImageDefaultOrCache(with name: String = "", key: String) {
        var image: UIImage?
        if let dataCache = UserDefaultHelper.shared.getImage(key: key) {
            image = UIImage(data: dataCache)
        } else {
            image = UIImage(named: name)
        }
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
