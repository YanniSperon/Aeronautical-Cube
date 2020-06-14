//
//  SettingsGUI.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/14/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI

struct SettingsGUI: View {
    @ObservedObject var currentPlayerUI: Player
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Spacer()
                    Text("Currently there are no customizable settings")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 5))
                        .padding(.horizontal, 20)
                        .shadow(radius: 5)
                }
                Group {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button(action: {
                        self.currentPlayerUI.currentSceneInt = Scene.MainMenu
                    }) {
                        Text("Back")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.white)
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
    }
}

struct SettingsGUI_Previews: PreviewProvider {
    static var previews: some View {
        GUI(currentPlayerUI: Player())
    }
}
