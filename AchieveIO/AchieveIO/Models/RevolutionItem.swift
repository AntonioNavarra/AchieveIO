//
//  RevolutionItem.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 03/01/25.
//

import Foundation

// MARK: - Sample Data
struct RevolutionItem: Identifiable {
    var id = UUID()
    var title: String
    var category: String
    var frequency: String
    var imageName: String
    var goalObject: String
    var completions: Int // 0 to 365
    var creationDate: Date
    var expiryDate: Date
    var reminder: String // Weekly, Daily, Monthly
}
