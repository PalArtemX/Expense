//
//  DateFormatter.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd//yyyy"
        
        return formatter
    }()
}
