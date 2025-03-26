//
//  ProfileView.swift
//  MathGameApp
//
//  Created by Alexandre Samson on 26.03.25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("👤 Benutzerprofil")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)

            Text("Hier siehst du deinen Fortschritt und Erfolge!")
                .font(.title2)
                .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
