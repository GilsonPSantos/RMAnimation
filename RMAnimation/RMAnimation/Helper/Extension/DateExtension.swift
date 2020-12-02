//
//  DateExtension.swift
//  RMAnimation
//
//  Created by Gilson Santos on 01/12/20.
//  Copyright © 2020 Gilson Santos. All rights reserved.
//

import Foundation

extension Date {
    func convertDateToStringDDMMYYYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
