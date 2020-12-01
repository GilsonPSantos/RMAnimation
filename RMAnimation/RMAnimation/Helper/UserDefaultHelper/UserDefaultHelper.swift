//
//  UserDefaultHelper.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

final class UserDefaultHelper {
    static let shared = UserDefaultHelper()
    let userDefaul = UserDefaults.standard
    private init(){}
}

extension UserDefaultHelper {
    public func saveImage(data: Data, key: String) {
        self.userDefaul.set(data, forKey: key)
        self.userDefaul.synchronize()
    }
    
    public func getImage(key: String) -> Data? {
        return self.userDefaul.data(forKey: key)
    }
}
