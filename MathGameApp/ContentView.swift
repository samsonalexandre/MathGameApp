//
//  ContentView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//

import SwiftUI

struct ContentView: View {
    @State private var userProgress: Double = 0.2 // Fortschritt für Beispiel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("MatheMeister 🎓")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)

                Image(systemName: "brain.head.profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.secondary)

                Text("Wähle eine Kategorie:")
                    .font(.title2)
                    .bold()

                VStack(spacing: 10) {
                    NavigationLink(destination: GameView(selectedOperation: .addition)) {
                        CategoryCard(icon: "plus.circle.fill", title: "Addition", color: .green, progress: userProgress)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .subtraction)) {
                        CategoryCard(icon: "minus.circle.fill", title: "Subtraktion", color: .red, progress: userProgress)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .multiplication)) {
                        CategoryCard(icon: "multiply.circle.fill", title: "Multiplikation", color: .purple, progress: userProgress)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .division)) {
                        CategoryCard(icon: "divide.circle.fill", title: "Division", color: .orange, progress: userProgress)
                    }
                }
                
                Spacer(minLength: 10)
                
                HStack {
                    NavigationLink(destination: HighscoreView()) {
                        BottomTab(icon: "trophy.fill", title: "Highscores")
                    }
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        BottomTab(icon: "person.crop.circle", title: "Profil")
                    }
                }
                .padding()
            }
            .padding()
            .animation(.easeInOut, value: UUID())
        }
    }
}

/// Reusable Komponente für Kategorie-Karten
struct CategoryCard: View {
    var icon: String
    var title: String
    var color: Color
    var progress: Double

    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .accentColor(.white)
            }
            .padding(.trailing)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

/// Reusable Komponente für die untere Navigationsleiste
struct BottomTab: View {
    var icon: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.primary)

            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
