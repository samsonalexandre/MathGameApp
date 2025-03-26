//
//  GameView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 26.03.25.
//


import SwiftUI

struct GameView: View {
    var selectedOperation: MathOperation  // ✅ Speichert die gewählte Rechenart
    @StateObject private var viewModel = MathGameViewModel()
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            Text("\(selectedOperation.rawValue) Übung 🎓")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)

            VStack {
                Text("\(viewModel.firstNumber) \(selectedOperation.rawValue) \(viewModel.secondNumber) = ?")
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(10)
                    .shadow(radius: 5)

                TextField("Antwort eingeben", text: $viewModel.userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
                    .frame(width: 140)
                    .multilineTextAlignment(.center)
                    .onAppear { isTextFieldFocused = true }

                Button("Überprüfen") {
                    viewModel.checkAnswer(selectedOperation: selectedOperation)
                    isTextFieldFocused = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .shadow(radius: 3)
            }
            .padding()

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
        }
        .padding()
        .onAppear {
            viewModel.generateNewQuestion(for: selectedOperation) // ✅ Richtige Rechenart verwenden
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(selectedOperation: .addition)  // ✅ Vorschau für Addition
    }
}
