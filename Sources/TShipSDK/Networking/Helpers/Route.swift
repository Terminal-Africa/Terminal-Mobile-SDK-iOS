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
    
    /// Route for getting rates for a multi-parcel shipment.
    case multiParcelShipmentRates
    
    /// Route used to create shipment tasks, track status of shipments and retrieve information about shipments.
    case shipments(String? = nil)
    
    /// Route used to track a shipment.
    case trackShipment(String)
    
    /// Route used to arrange pickup and delivery of a shipment.
    case arrangeShipment
    
    /// Route used to cancel a shipment.
    case cancelShipment
    
    /// Route used to fetch a user's profile.
    case users(String)
    
    /// Route used to fetch the user's wallet details.
    case userWallet
    
    /// Route used to fetch the user's wallet details.
    case userCarriers
    
    /// Route used to fetch transactions.
    case transactions(String? = nil)
    
    /// Route used to fetch carriers.
    case carriers(String? = nil)
    
    /// Route used to disable carriers.
    case disableCarrier(String)
    
    /// Route used to enable carriers.
    case enableCarrier(String)
    
    case insurancePremium
    
    case getInsurance(String)
    
    case fileClaim
    
    case claim(String)
    
    case tShopCountries
    
    case terminalReferenceAddress(String)
    
    case tShopRate
    
    case tShopChargeShipment
    
    case reportShipmentPickupDelay
    
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
            
        case .multiParcelShipmentRates:
            return "/rates/multi/shipment"
            
        case .shipments(let shipmentId):
            if let shipmentId = shipmentId {
                return "/shipments/\(shipmentId)"
            }
            return "/shipments"
            
        case .trackShipment(let shipmentId):
            return "/shipments/track/\(shipmentId)"
            
        case .arrangeShipment:
            return "/shipments/pickup"
            
        case .cancelShipment:
            return "/shipments/cancel"
            
        case .users(let userId):
            return "/users/\(userId)"
            
        case .userWallet:
            return "/users/wallet-balance"
            
        case .userCarriers:
            return "/users/carriers"
            
        case .transactions(let transactionId):
            if let transactionId = transactionId {
                return "/transactions/\(transactionId)"
            }
            return "/transactions"
           
        case .carriers(let carrierId):
            if let carrierId = carrierId {
                return "/carriers/\(carrierId)"
            }
            return "/carriers"
           
        case .disableCarrier(let carrierId):
            return "/carriers/disable/\(carrierId)"
           
        case .enableCarrier(let carrierId):
            return "/carriers/enable/\(carrierId)"
           
        case .insurancePremium:
            return "/insurance/premium"
           
        case .getInsurance(let shipmentId):
            return "/insurance/\(shipmentId)"
           
        case .fileClaim:
            return "/claims/file"
           
        case .claim(let id):
            return "/claims/\(id)"
            
        case .tShopCountries:
            return "/shopship/countries"
            
        case .terminalReferenceAddress(let tShopId):
            return "/shopship/terminal-address/\(tShopId)"
            
        case .tShopRate:
            return "/shopship/rate"
            
        case .tShopChargeShipment:
            return "/shopship/charge"
            
        case .reportShipmentPickupDelay:
            return "/shipments/pickup-delay-report"
            
        }
    }
    
}
