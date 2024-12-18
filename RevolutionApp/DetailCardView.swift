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
            // Parte superiore con titolo e immagine
            VStack {
                // Titolo e sottotitolo
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.blackRev)

                    Text("Drink 10 cups of water today")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 24)

                // Immagine della categoria con ellipses
                ZStack {
                    Image("Ellipses")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .opacity(0.1)

                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 220)
                }
                .padding(.horizontal, 24)
            }
            .padding(.top, 24)

            Spacer()

            // Card contenitore
            VStack(spacing: 16) {
                // Date Section
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 60, height: 60)

                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 28))
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Creation date: **22 December 2024**")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Expiration date: **13 February 2025**")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                Divider()
                    .background(Color.gray.opacity(0.3))

                // Progress Section
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
                                .trim(from: 0.0, to: 0.2)
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.pink, Color.purple]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    ),
                                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                                )
                                .rotationEffect(.degrees(-90))
                                .animation(.easeOut, value: 0.2)

                            Text("20%")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.blackRev)
                        }
                        .frame(width: 100, height: 100)

                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("28 tasks completed")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
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
                                    .fontWeight(.medium)
                                    .foregroundColor(.blackRev)
                            }
                            .padding(12)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        }
                    }
                }

                Divider()
                    .background(Color.gray.opacity(0.3))

                // Completion Button
                Button(action: {
                    print("\(item.title) task completed!")
                }) {
                    Text("Complete Task")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.pink, Color.purple]),
                                startPoint: .leading,
                                endPoint: .trailing
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
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal, 24)
            .padding(.bottom, 24) // Padding per evitare che la card si sovrapponga ai bordi inferiori
        }
        .background(Color.gray.opacity(0.05).ignoresSafeArea())
        .edgesIgnoringSafeArea(.bottom) // Rende la card che tocca il bordo inferiore
    }
}
