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
    
    /// Route for fetching list of cities within a state valid on TShip.
    case cities
    
    /// Packaging Route for creating, fetching and updating Packaging. Pass in the packaging id to add it to the url.
    case packaging(String? = nil)
    
    /// Parcel Route for creating, fetching and updating Parcels. Pass in the Parcel id to add it to the url.
    case parcels(String? = nil)
    
    /// Route for getting rates for a shipment.
    case shipmentRates
    
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
            
        case .cities:
            return "/cities"
            
        case .packaging(let packagingId):
            if let packagingId = packagingId {
                return "/packaging/\(packagingId)"
            }
            return "/packaging"
            
        case .parcels(let parcelId):
            if let parcelId = parcelId {
                return "/parcels/\(parcelId)"
            }
            return "/parcels"
            
        case .shipmentRates:
            return "/rates/shipment"
            
        }
    }
    
}
