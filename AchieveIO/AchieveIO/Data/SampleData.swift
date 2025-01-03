//
//  SampleData.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 03/01/25.
//

import Foundation


let RevolutionItems: [RevolutionItem] = [
    // Wellness
    RevolutionItem(title: "Drink more water", category: "Wellness", frequency: "Every Day", imageName: "DrinkWater", goalObject: "Drink at least 8 glasses of water daily to stay hydrated.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!, reminder: "Daily"),
    RevolutionItem(title: "Daily exercise", category: "Wellness", frequency: "Every Day", imageName: "Exercise", goalObject: "Dedicate at least 30 minutes daily to physical activity to improve health.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!, reminder: "Daily"),
    
    // Mindfulness
    RevolutionItem(title: "Daily gratitude journal", category: "Mindfulness", frequency: "Every Day", imageName: "GratitudeJournal", goalObject: "Write three things you're grateful for each day.", completions: 5, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!, reminder: "Daily"),
    RevolutionItem(title: "Evening meditation", category: "Mindfulness", frequency: "Every Day", imageName: "Meditation", goalObject: "Spend 10 minutes meditating before bed to relax your mind.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!, reminder: "Daily"),
    
    // Adventure
    RevolutionItem(title: "Weekly hiking trips", category: "Adventure", frequency: "Every Week", imageName: "WeeklyHikingTrips", goalObject: "Explore a new trail every week to stay active and adventurous.", completions: 1, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 3, to: Date())!, reminder: "Weekly"),
    RevolutionItem(title: "Weekend bike rides", category: "Adventure", frequency: "Every Week", imageName: "BikeRides", goalObject: "Go on a bike ride every weekend to explore new areas.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 3, to: Date())!, reminder: "Weekly"),
    
    // Community
    RevolutionItem(title: "Random acts of kindness", category: "Community", frequency: "Every Week", imageName: "Kindness", goalObject: "Perform a random act of kindness each week to spread positivity.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 3, to: Date())!, reminder: "Weekly"),
    RevolutionItem(title: "Volunteer in the community", category: "Community", frequency: "Every Month", imageName: "Volunteer", goalObject: "Participate in one community service activity monthly.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!, reminder: "Monthly"),
    
    // Finance
    RevolutionItem(title: "Budget planning", category: "Finance", frequency: "Every Month", imageName: "BudgetPlan", goalObject: "Review and adjust your monthly budget to align with your financial goals.", completions: 0, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 6, to: Date())!, reminder: "Monthly"),
    RevolutionItem(title: "Save money", category: "Finance", frequency: "Every Week", imageName: "SaveMoney", goalObject: "Set aside a fixed amount weekly for future goals.", completions: 3, creationDate: Date(), expiryDate: Calendar.current.date(byAdding: .month, value: 4, to: Date())!, reminder: "Weekly")
]
