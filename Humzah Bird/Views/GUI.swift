//
//  GUI.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/12/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI

struct GUI: View {
    @ObservedObject var currentPlayerUI: Player
    var body: some View {
        VStack {
            if (currentPlayerUI.currentSceneInt == Scene.MainMenu) {
                MainMenuGUI(currentPlayerUI: currentPlayerUI)
            } else if (currentPlayerUI.currentSceneInt == Scene.Game) {
                GameGUI(currentPlayerUI: currentPlayerUI)
            } else if (currentPlayerUI.currentSceneInt == Scene.Statistics) {
                StatisticsGUI(currentPlayerUI: currentPlayerUI)
            } else if (currentPlayerUI.currentSceneInt == Scene.Settings) {
                SettingsGUI(currentPlayerUI: currentPlayerUI)
            } else {
                MainMenuGUI(currentPlayerUI: currentPlayerUI)
            }
        }
    }
}

struct GUI_Previews: PreviewProvider {
    static var previews: some View {
        GUI(currentPlayerUI: Player())
    }
}
