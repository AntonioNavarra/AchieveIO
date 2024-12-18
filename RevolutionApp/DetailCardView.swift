//
//  RevDetailView.swift
//  RevolutionApp
//
//  Created by Antonio Navarra on 17/12/24.
//

import SwiftUI

struct RevDetailView: View {
    var title: String
    var subtitle: String
    var creationDate: String
    var expirationDate: String
    var progress: Double
    var completionCount: Int
    var imageName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Titolo e Sottotitolo
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.blackRev)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            // Immagine centrale
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.2))
                    .frame(height: 180)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }

            // Date di creazione e scadenza
            HStack {
                VStack(alignment: .leading) {
                    Text("Creation date:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(creationDate)
                        .font(.caption)
                        .foregroundColor(.blackRev)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Expiration date:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(expirationDate)
                        .font(.caption)
                        .foregroundColor(.blackRev)
                }
            }
            .padding(.horizontal, 10)

            // Barra dei progressi
            VStack(alignment: .leading) {
                Text("Goal Previews")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blackRev)

                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                        Text("\(Int(progress * 100))%")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .frame(width: 50, height: 50)

                    Spacer()

                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.purpleRev)
                        Text("\(completionCount) times completed")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.horizontal, 10)

            // Bottone per completare il task
            Button(action: {
                print("\(title) completed!")
            }) {
                Text("Complete Task")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purpleRev)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 5)
        .padding(.horizontal, 10)
    }
}

#Preview {
    RevDetailView(title: <#T##String#>, subtitle: <#T##String#>, creationDate: <#T##String#>, expirationDate: <#T##String#>, progress: <#T##Double#>, completionCount: <#T##Int#>, imageName: <#T##String#>)
}

