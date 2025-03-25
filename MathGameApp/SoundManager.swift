//
//  SoundManager.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 25.03.25.
//

import AVFoundation

class SoundManager {
    static var audioPlayer: AVAudioPlayer?
    
    static func playSound(named soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Fehler beim Abspielen von \(soundName)")
            }
        }
    }
}
