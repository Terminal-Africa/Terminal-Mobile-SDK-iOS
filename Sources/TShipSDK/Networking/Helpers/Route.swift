//
//  Route.swift
//
//  Created by Mohammed Adetunji on 13/10/2022.
//

import Foundation

/// Enum represents routes in the TShipAPI.
enum Route {
    /// Base Url for the TShipAPI
    static let baseUrl = "https://sandbox.terminal.africa/v1"
    
    /// Address Route for creating, fetching and updating Addresses. Pass in the address id to add it to the url.
    case address(String? = nil)
    
    /// Route for fetching list of countries valid on TShip.
    case countries
    
    /// Route for fetching list of states within a country valid on TShip.
    case states
    
    /// String representation of the route
    var description: String {
        switch self {
            
        case .address(let addressId):
            if let addressId = addressId {
                return "/addresses/\(addressId)"
            }
            return "/addresses"
            
        case .countries:
            return "/countries"
            
        case .states:
            return "/states"
            
        }
    }
}
