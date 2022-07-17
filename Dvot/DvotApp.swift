//
//  DvotApp.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI

@main
struct DvotApp: App {
    
    init() {
            UITableView.appearance().backgroundColor = .white
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
