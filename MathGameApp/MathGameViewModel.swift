//
//  MathGameViewModel.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//

import SwiftUI

class MathGameViewModel: ObservableObject {
    @Published var firstNumber: Int = 1
    @Published var secondNumber: Int = 1
    @Published var userAnswer: String = ""
    @Published var score: Int = 0
    @Published var level: Int = 1
    @Published var feedback: String = ""
    @Published var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")

    func generateNewQuestion(for operation: MathOperation) {
        firstNumber = Int.random(in: 1...(5 * level))
        secondNumber = Int.random(in: 1...(5 * level))

        if operation == .division {
            firstNumber = secondNumber * Int.random(in: 1...5)  // ✅ Division ohne Kommawerte
        }
    }

    func checkAnswer(selectedOperation: MathOperation) {
        guard let userAnswerInt = Int(userAnswer) else {
            feedback = "Bitte eine Zahl eingeben! ❌"
            return
        }

        let correctAnswer = selectedOperation.calculate(firstNumber, secondNumber)
        
        if userAnswerInt == correctAnswer {
            feedback = "Richtig! 🎉"
            score += 1

            if score > highScore {
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "HighScore")
            }
            
            if score % 5 == 0 { levelUp() }
        } else {
            feedback = "Falsch 😢"
        }

        userAnswer = ""
        generateNewQuestion(for: selectedOperation) // ✅ Neue Frage mit der gleichen Rechenart
    }

    func levelUp() {
        level += 1
        feedback = "Level \(level) erreicht! 🎯"
    }
}
