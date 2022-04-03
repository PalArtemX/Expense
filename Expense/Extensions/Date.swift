//
//  Date.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation


extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}
