//
//  Color.swift
//  Expense
//
//  Created by Artem Paliutin on 03/04/2022.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let background = Color("Background")
    let icon = Color("Icon")
    let text = Color("Text")
    let systemBackground = Color(uiColor: .systemBackground)
}


extension Color {
    static var colorTheme = ColorTheme()
}
