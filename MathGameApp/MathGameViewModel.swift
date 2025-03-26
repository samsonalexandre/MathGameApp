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
    @Published var operation: MathOperation = .addition
    @Published var userAnswer: String = ""
    @Published var score: Int = 0
    @Published var level: Int = 1
    @Published var feedback: String = ""
    @Published var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @Published var timeRemaining: Int = 100
    @Published var gameOver: Bool = false

    var timer: Timer?

    init() {
        generateNewQuestion()
        startTimer()
    }

    var correctAnswer: Int {
        operation.calculate(firstNumber, secondNumber)
    }

    func checkAnswer() {
        guard let userAnswerInt = Int(userAnswer) else {
            feedback = "Bitte eine Zahl eingeben! ❌"
            return
        }

        if userAnswerInt == correctAnswer {
            feedback = "Richtig! 🎉"
            score += 1
            SoundManager.playSound(named: "correct")

            if score > highScore {
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "HighScore")
            }
            if score % 5 == 0 { levelUp() }
        } else {
            feedback = "Falsch 😢"
            score = max(0, score - 1)
            SoundManager.playSound(named: "wrong")
        }

        userAnswer = ""
        generateNewQuestion()
        resetTimer()
    }

    func generateNewQuestion() {
        firstNumber = Int.random(in: 1...(5 * level))
        secondNumber = Int.random(in: 1...(5 * level))
        operation = MathOperation.allCases.randomElement() ?? .addition

        if operation == .division {
            firstNumber = secondNumber * Int.random(in: 1...5)
        }
    }

    func levelUp() {
        level += 1
        feedback = "Level \(level) erreicht! 🎯"
        SoundManager.playSound(named: "levelup")
    }

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timeRemaining -= 1
            if self.timeRemaining == 0 {
                self.gameOver = true
                self.feedback = "Zeit abgelaufen! ⏳"
                self.timer?.invalidate()
            }
        }
    }

    func resetTimer() {
        timeRemaining = 100
        startTimer()
    }
}
