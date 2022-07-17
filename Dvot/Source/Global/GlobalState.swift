//
//  GlobalState.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI

class GlobalState: ObservableObject {
    @Published var token: String? = nil
}
