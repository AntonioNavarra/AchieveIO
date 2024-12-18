//  HomeView.swift
//  RevolutionApp
//  Created by Antonio Navarra on 11/12/24.


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome back, Antonio")
                            .font(.subheadline)
                            .foregroundColor(.blackRev)
                            .padding(.top, 20)

                        Text("Start Building Your Best Self Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blackRev)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal)

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search your revolution ...", text: .constant(""))
                            .foregroundColor(.primary)
                            .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(45)
                    .padding(.horizontal)
                    .shadow(radius: 8, x: 0, y: 8)

                    // Vertical Scroll View for Cards
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(revolutionItems.chunked(into: 2), id: \..first?.id) { pair in
                                HStack(spacing: 16) {
                                    ForEach(pair) { item in
                                        NavigationLink(destination: DetailCardView(item: item)) {
                                            RevolutionCard(
                                                title: item.title,
                                                category: item.category,
                                                frequency: item.frequency,
                                                colorCategory: colorForCategory(item.category),
                                                colorCard: colorForCard(item.category),
                                                imageName: item.imageName
                                            )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    
                    // Bottom Navigation Bar
                    HStack {
                        Spacer()
                        BottomNavItem(icon: "house.fill", isSelected: true)
                        Spacer()
                        BottomNavItem(icon: "trophy.fill", isSelected: false)
                        Spacer()
                    }
                    .padding()
                    .background(Color.purplePrimary.opacity(0.2))
                    .cornerRadius(40)
                    .padding(.horizontal, 40)
                    .padding(.trailing, 80)
                }

                // Floating Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton()
                            .padding(.trailing, 30)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
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
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(20)
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
    var colorCategory: Color
    var colorCard: Color
    var imageName: String

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Image("Ellipses")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 100)
                    .opacity(0.3)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 100)
            }
            .padding(.top, 10)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.blackRev)
                .padding(.bottom, 10)

            HStack(spacing: 10) {
                Text(category)
                    .font(.caption)
                    .fontWeight(.bold)
                    .frame(width: 80, height: 35)
                    .foregroundColor(colorCategory)
                    .background(Color.white)
                    .cornerRadius(13)

                Text("Reminder \(frequency)")
                    .font(.custom("ReminderSize", size: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(colorCard)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct RevolutionItem: Identifiable {
    var id = UUID()
    var title: String
    var category: String
    var frequency: String
    var imageName: String
}

let revolutionItems: [RevolutionItem] = [
    RevolutionItem(title: "Get back into shape", category: "Health", frequency: "Every Week", imageName: "GetBackIntoShape"),
    RevolutionItem(title: "More water", category: "Health", frequency: "Every Day", imageName: "DrinkWater"),
    RevolutionItem(title: "Morning exercise", category: "Meditation", frequency: "Every Day", imageName: "Meditation"),
    RevolutionItem(title: "Go more outside", category: "Adventure", frequency: "Every Week", imageName: "GoOutside")
]

func colorForCategory(_ category: String) -> Color {
    switch category {
    case "Meditation":
        return .pinkMeditation
    case "Health":
        return .blueHealth
    case "Adventure":
        return .greenAdventure
    default:
        return .gray
    }
}

func colorForCard(_ category: String) -> Color {
    switch category {
    case "Meditation":
        return .pinkCard
    case "Health":
        return .blueCard
    case "Adventure":
        return .greenCard
    default:
        return .gray.opacity(0.5)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
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
