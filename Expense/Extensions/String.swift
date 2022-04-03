//
//  String.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation


extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return parsedDate
    }
}
