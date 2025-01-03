//  HomeView.swift
//  RevolutionApp
//  Created by Antonio Navarra on 11/12/24.

import SwiftUI

// MARK: - Home View
struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: Header Section
                    HeaderView()
                        .padding(.horizontal)
                    
                    // MARK: Search Bar
                    SearchBarView()
                        .padding(.horizontal)
                    
                    // MARK: Revolution Cards
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(RevolutionItems.chunked(into: 2), id: \.first?.id) { pair in
                                HStack(spacing: 16) {
                                    ForEach(pair) { item in
                                        NavigationLink(destination: DetailCardView(item: item)) {
                                            RevolutionCard(
                                                title: item.title,
                                                category: item.category,
                                                frequency: item.frequency,
                                                colorCategory: RevolutionItemManager.colorForCategory(item.category),
                                                colorCard: RevolutionItemManager.colorForCard(item.category),
                                                imageName: item.imageName
                                            )
                                            .frame(maxWidth: .infinity)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: Bottom Navigation Bar
                    BottomNavigationBar()
                        .padding(.horizontal, 40)
                        .padding(.trailing, 80)
                }
                
                // MARK: Floating Button
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
            .background(Color.gray.opacity(0.05).ignoresSafeArea())
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Welcome back, Antonio")
                .font(.subheadline)
                .foregroundColor(.blackRev)
                .padding(.top, 30)

            Text("Start Building Your Best Self Today")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blackRev)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

// MARK: - Search Bar View
struct SearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.title3)
            TextField("Search your revolution ...", text: .constant(""))
                .foregroundColor(.primary)
                .autocorrectionDisabled()
                .font(.body)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(45)
        .shadow(radius: 10, x: 0, y: 5)
    }
}

// MARK: - Revolution Card View
struct RevolutionCard: View {
    var title: String
    var category: String
    var frequency: String
    var colorCategory: Color
    var colorCard: Color
    var imageName: String

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Image("Ellipses")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 100)
                    .opacity(0.4)

                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 100)
            }
            .padding(.top, 10)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.blackRev)
                .padding(.vertical, 5)
                .multilineTextAlignment(.center)

            HStack(spacing: 10) {
                Text(category)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(colorCategory)
                    .frame(width: 80, height: 35)
                    .background(Color.white)
                    .cornerRadius(13)

                Text("Reminder \(frequency)")
                    .font(.custom("ReminderSize", size: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 170, height: 250)
        .background(colorCard)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

// MARK: - Floating Button
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
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.pink, Color.purplePrimary]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}

// MARK: - Bottom Navigation Bar
struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            BottomNavItem(icon: "house.fill", isSelected: true)
            Spacer()
            BottomNavItem(icon: "trophy.fill", isSelected: false)
            Spacer()
        }
        .padding(.vertical)
        .background(Color.purplePrimary.opacity(0.2))
        .cornerRadius(40)
    }
}

// MARK: - Bottom Navigation Item
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

// MARK: - Array Extension
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
