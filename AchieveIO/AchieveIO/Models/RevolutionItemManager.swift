//
//  RevolutionItemManager.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 03/01/25.
//

import SwiftUI

class RevolutionItemManager {
    static func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Mindfulness":
            return .pinkMeditation
        case "Wellness":
            return .blueHealth
        case "Adventure":
            return .greenAdventure
        case "Personal Growth":
            return .yellowPersonal
        case "Finance":
            return .grayFinance
        case "Community":
            return .purpleCommunity
        default:
            return .gray
        }
    }

    static func colorForCard(_ category: String) -> Color {
        switch category {
        case "Mindfulness":
            return .pinkCard
        case "Wellness":
            return .blueCard
        case "Adventure":
            return .greenCard
        case "Personal Growth":
            return .yellowCard
        case "Finance":
            return .grayCard
        case "Community":
            return .purpleCard
        default:
            return .gray.opacity(0.5)
        }
    }
}
