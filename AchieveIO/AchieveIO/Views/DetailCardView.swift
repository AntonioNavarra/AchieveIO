//
//  RevDetailView.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 17/12/24.
//

import SwiftUI

struct DetailCardView: View {
    var item: RevolutionItem

    var body: some View {
        VStack {
            // MARK: Top Section (Title and Image)
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.blackRev)

                    Text(item.goalObject)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 24)

                ZStack {
                    Image("Ellipses")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .opacity(0.4)

                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.85, maxHeight: UIScreen.main.bounds.height * 0.3)
                }
                .padding(.horizontal, 24)
            }
            .padding(.top, 24)

            Spacer()

            // MARK: Bottom Section (Details and Actions)
            VStack(spacing: 16) {
                // MARK: Dates Section
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                                .font(.system(size: 28))
                        )

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Creation date: **22 December 2024**")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Expiration date: **13 February 2025**")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                Divider().background(Color.gray.opacity(0.3))

                // MARK: Progress Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Goal Progress")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blackRev)

                    HStack(spacing: 24) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 12)
                                .opacity(0.3)
                                .foregroundColor(.gray)

                            Circle()
                                .trim(from: 0.0, to: CGFloat(item.completions) / 365.0)
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.pink, Color.purplePrimary]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    ),
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: CGFloat(item.completions) / 365.0)

                            Text("\(Int(CGFloat(item.completions) / 365.0 * 100))%")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.blackRev)
                        }
                        .frame(width: 100, height: 100)

                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("\(item.completions) tasks completed")
                                    .font(.subheadline)
                                    .foregroundColor(.blackRev)
                            }
                            .padding(12)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)

                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.orange)
                                Text("Last updated 2 days ago")
                                    .font(.subheadline)
                                    .foregroundColor(.blackRev)
                            }
                            .padding(12)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }

                Divider().background(Color.gray.opacity(0.3))

                // MARK: Completion Button
                Button(action: {
                    print("\(item.title) task completed!")
                }) {
                    Text("Complete Task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.pink, Color.purplePrimary]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(30)
                        .shadow(color: Color.pink.opacity(0.4), radius: 10, x: 0, y: 5)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 10)
            )
            .padding(.horizontal, 24)
            .frame(height: UIScreen.main.bounds.height * 0.45)
            .padding(.bottom, 24)
        }
        .background(Color.gray.opacity(0.05).ignoresSafeArea())
    }
}
