//
//  GameGUI.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/12/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI

struct GameGUI: View {
    @ObservedObject var currentPlayerUI: Player
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text("Score: \(currentPlayerUI.currentScore)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 5))
                    .padding(.horizontal, 20)
                    .shadow(radius: 5)
            }
            Spacer()
        }
    }
}

struct GameGUI_Previews: PreviewProvider {
    static var previews: some View {
        GUI(currentPlayerUI: Player())
    }
}
