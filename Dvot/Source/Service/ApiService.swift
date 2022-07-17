//
//  ApiService.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI


class ApiServices {
    static let API_URL = "https://dvot-api.herokuapp.com"
    static var TOKEN = ""
    static var USER: User? = nil
    static let API_DEFAULT_RESPONSE: ApiResponse = ApiResponse(error: true, message: "An error has occured", data: [])
}
