//
//  TShopAddress.swift
//  
//
//  Created by maxSpane on 14/04/2023.
//

public struct TShopAddress: Decodable {
    
    /// Unique id used to identify the address
    public let tShopId : String
    
    /// Name of the city the address is located in
    public let city : String
    
    /// Name of the country the address is located in
    public let country : String
    
    /// Line1 of the Address
    public let line1 : String
    
    /// Line2 of the Address
    public let line2 : String
    
    /// Phone number of the person at the location
    public let phoneNumber : String
    
    /// Name of the state the address is located in
    public let state : String
    
    /// Zip code of the region the address is located in
    public let zipCode : String
    
    public let isoCode : String
    
    public let active : Bool
    
    /// Geographical Coordinates of the addresss
    public let coordinates: Coordinates
    
    private enum CodingKeys : String, CodingKey {
        case tShopId = "shop_ship_id"
        case phoneNumber = "phone"
        case zipCode = "zip"
        case isoCode = "isocode"
        case city, country, line1, line2, state, coordinates, active
    }
    
}
