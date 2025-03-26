//
//  ContentView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//
import SwiftUI

struct ContentView: View {
    @AppStorage("progressAddition") private var progressAddition: Double = 0.0
    @AppStorage("progressSubtraction") private var progressSubtraction: Double = 0.0
    @AppStorage("progressMultiplication") private var progressMultiplication: Double = 0.0
    @AppStorage("progressDivision") private var progressDivision: Double = 0.0
        
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("Mathe Meister 🎓")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)

                Image(systemName: "brain.head.profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.secondary)

                Text("Wähle eine Kategorie:")
                    .font(.title2)
                    .bold()

                VStack(spacing: 10) {
                    NavigationLink(destination: GameView(selectedOperation: .addition)) {
                        CategoryRow(title: "Addition", icon: "plus.circle.fill", color: .green, progress: $progressAddition)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .subtraction)) {
                        CategoryRow(title: "Subtraktion", icon: "minus.circle.fill", color: .red, progress: $progressSubtraction)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .multiplication)) {
                        CategoryRow(title: "Multiplikation", icon: "multiply.circle.fill", color: .purple, progress: $progressMultiplication)
                    }
                    NavigationLink(destination: GameView(selectedOperation: .division)) {
                        CategoryRow(title: "Division", icon: "divide.circle.fill", color: .orange, progress: $progressDivision)
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
                .padding(.bottom, 5)
            }
            .padding(.horizontal)
            .animation(.easeInOut, value: UUID())
        }
    }
}

struct CategoryRow: View {
    var title: String
    var icon: String
    var color: Color
    @Binding var progress: Double
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .accentColor(.white)
            }
            
            Spacer()
            
            Button(action: {
                progress = 0.0
UserDefaults.standard.set(progress, forKey: "progress" + title)
UserDefaults.standard.set(progress, forKey: "progress" + title)

                UserDefaults.standard.set(progress, forKey: "progress" + title)
            }) {
                Image(systemName: "arrow.uturn.left.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
            }
            .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity, minHeight: 110)
        .background(color)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct BottomTab: View {
    var icon: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
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

