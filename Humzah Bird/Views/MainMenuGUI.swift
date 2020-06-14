//
//  MainMenuGUI.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/12/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI

struct MainMenuGUI: View {
    @ObservedObject var currentPlayerUI: Player
    var body: some View {
        VStack {
            Text("High Score: \(currentPlayerUI.highScore)")
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
            Group {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Button(action: {
                DispatchQueue.main.async {
                    gameViewController!.displayGameScene()
                }
                self.currentPlayerUI.currentSceneInt = Scene.Game
            }) {
                Text("Play")
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
            Spacer().frame(height:10)
            HStack {
                Button(action: {
                    self.currentPlayerUI.currentSceneInt = Scene.Settings
                }) {
                    Text("Settings")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.title)
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
                Button(action: {
                    self.currentPlayerUI.currentSceneInt = Scene.Statistics
                }) {
                    Text("Statistics")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.title)
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
            }
            Spacer()
        }
    }
}

struct MainMenuGUI_Previews: PreviewProvider {
    static var previews: some View {
        GUI(currentPlayerUI: Player())
    }
}
