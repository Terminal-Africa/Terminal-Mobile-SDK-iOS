//
//  Route.swift
//  Yummie
//
//  Created by Mohammed Adetunji on 13/10/2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://sandbox.terminal.africa/v1"
    
    case createAddress
    
    var description: String {
        switch self {
        case .createAddress:
            return "/addresses"
        }
    }
}
