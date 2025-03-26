//
//  HighscoreView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 26.03.25.
//

import SwiftUI

struct HighscoreView: View {
    var body: some View {
        VStack {
            Text("🏆 Highscores")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)

            List {
                Text("1. Alex - 100 Punkte")
                Text("2. Sam - 90 Punkte")
                Text("3. Chris - 80 Punkte")
            }
        }
        .padding()
    }
}

struct HighscoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreView()
    }
}
