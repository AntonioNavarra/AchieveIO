//  ContentView.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 11/12/24.

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 40) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Welcome back, Antonio")
                            .font(.headline)
                            .foregroundColor(.gray)

                        Text("Start Building Your Best Self Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                    }
                    .padding(.horizontal)

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search your revolution ...", text: .constant(""))
                            .foregroundColor(.primary)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(45)
                    .padding(.horizontal)

                    // Cards Grid
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(revolutionItems) { item in
                            RevolutionCard(title: item.title,
                                           category: item.category,
                                           frequency: item.frequency,
                                           color: colorForCategory(item.category))
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    // Bottom Navigation Bar
                    HStack {
                        Spacer()
                        BottomNavItem(icon: "house.fill", isSelected: true)
                        Spacer()
                        Spacer()
                        BottomNavItem(icon: "trophy.fill", isSelected: false)
                        Spacer()
                    }
                    .padding()
                    .background(Color.purplePrimary.opacity(0.2))
                    .cornerRadius(40)
                    .padding(.horizontal, 40)
                    .padding(.trailing, 100)
                    .padding(.bottom, 10)
                }

                // Floating Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton()
                            .padding(.trailing, 40)
                            .padding(.bottom, 10)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FloatingButton: View {
    var body: some View {
        Button(action: {
            print("Floating button tapped!")
        }) {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .padding()
                .background(Color.purplePrimary)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}

struct RevolutionCard: View {
    var title: String
    var category: String
    var frequency: String
    var color: Color

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.bottom)

            HStack(spacing: 8) {
                Text(category)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .frame(width: 80, height: 35)
                    .foregroundColor(color)
                    .background(Color.white)
                    .cornerRadius(13)

                Text("Reminder \(frequency)")
                    .font(.custom("ReminderSize", size: 9))
                    .foregroundColor(.gray)
            }

        }
        .padding()
        .background(Color.pinkCard)
        .cornerRadius(20)
    }
}

struct RevolutionItem: Identifiable {
    var id = UUID()
    var title: String
    var category: String
    var frequency: String
}

let revolutionItems: [RevolutionItem] = [
    RevolutionItem(title: "Morning exercise", category: "Meditation", frequency: "Every Day"),
    RevolutionItem(title: "More water", category: "Health", frequency: "Every Day"),
    RevolutionItem(title: "Go outside", category: "Adventure", frequency: "Every Week"),
    RevolutionItem(title: "Don’t smoke", category: "Health", frequency: "Every Week")
]

func colorForCategory(_ category: String) -> Color {
    switch category {
    case "Meditation":
        return .pinkMeditation
    case "Health":
        return .blueCard
    case "Adventure":
        return .greenCard
    default:
        return .gray
    }
}

struct BottomNavItem: View {
    var icon: String
    var isSelected: Bool

    var body: some View {
        Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .frame(width: 33, height: 33)
            .foregroundColor(isSelected ? Color.purplePrimary : Color.gray)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
