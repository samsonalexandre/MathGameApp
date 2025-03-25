//
//  MathGameModel.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//

import Foundation

enum MathOperation: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        switch self {
        case .addition: return a + b
        case .subtraction: return a - b
        case .multiplication: return a * b
        case .division: return b == 0 ? 1 : a / b
        }
    }
}
