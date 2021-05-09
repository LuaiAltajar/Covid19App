//
//  Extension.swift
//  Covid19 App
//
//  Created by Luai Altajar on 08.05.2021.
//

import Foundation
extension Int {
    func formatNumber() -> String{
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Int64 {
    func formatNumber() -> String{
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

