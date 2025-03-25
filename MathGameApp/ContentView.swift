//
//  ContentView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MathGameViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Mathe-Lernspiel 🎓")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)

            Text("\(viewModel.firstNumber) \(viewModel.operation.rawValue) \(viewModel.secondNumber) = ?")
                .font(.title)
                .bold()
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(10)
                .shadow(radius: 5)
                .scaleEffect(viewModel.feedback == "Richtig! 🎉" ? 1.2 : 1.0)
                .animation(.spring(), value: viewModel.feedback)

            TextField("Deine Antwort", text: $viewModel.userAnswer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 100)
                .multilineTextAlignment(.center)

            Button(action: { viewModel.checkAnswer() }) {
                Text("Überprüfen")
                    .padding()
                    .frame(width: 150)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .shadow(radius: 3)
            }
            .scaleEffect(viewModel.feedback == "Richtig! 🎉" ? 1.1 : 1.0)
            .animation(.easeIn, value: viewModel.feedback)

            Text(viewModel.feedback)
                .font(.headline)
                .foregroundColor(viewModel.feedback.contains("Richtig") ? .green : .red)

            HStack {
                Text("Punkte: \(viewModel.score)")
                    .font(.title2)
                    .bold()
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)

                Text("Level: \(viewModel.level)")
                    .font(.title2)
                    .bold()
                    .padding()
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(10)
            }

            Text("🏆 Highscore: \(viewModel.highScore)")
                .font(.title3)
                .bold()
                .foregroundColor(.purple)

            Text("⏳ Zeit: \(viewModel.timeRemaining)s")
                .font(.headline)
                .foregroundColor(.red)
        }
        .padding()
        .alert(isPresented: $viewModel.gameOver) {
            Alert(title: Text("Spiel beendet!"), message: Text("Punkte: \(viewModel.score)"), dismissButton: .default(Text("Neustart")) {
                viewModel.score = 0
                viewModel.level = 1
                viewModel.generateNewQuestion()
                viewModel.resetTimer()
            })
        }
    }
}

#Preview {
    ContentView()
}
