//
//  StatisticsGUI.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/14/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI

struct StatisticsGUI: View {
    @ObservedObject var currentPlayerUI: Player
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Spacer()
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
                    Spacer().frame(height:10)
                    Text("Games Played: \(currentPlayerUI.timesPlayed)")
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
                    Spacer().frame(height:10)
                    Text("Total Score: \(currentPlayerUI.sumOfScores)")
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
                    Spacer().frame(height:10)
                    if (currentPlayerUI.timesPlayed != 0) {
                        Text("Average Score: \(IntIntTupleToString(number: (CGFloat(currentPlayerUI.sumOfScores)/CGFloat(currentPlayerUI.timesPlayed)).Truncate(decimalPlaces: 2), decimalPlaces: 2))")
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
                    } else {
                        Text("Average Score: 0.0")
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
                }
                Group {
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

struct StatisticsGUI_Previews: PreviewProvider {
    static var previews: some View {
        GUI(currentPlayerUI: Player())
    }
}
