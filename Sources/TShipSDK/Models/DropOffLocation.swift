//
//  DropoffLocation.swift
//  
//
//  Created by maxSpane on 11/08/2023.
//

import UIKit

public struct DropOffLocation: Decodable {
    
    public let address: String
    
    public let city: String
    
    public let state: String
    
    public let country: String
    
    public let dropOffLocationId: String
    
    public let email: String
    
    public let phone: String
    
    public let carrier: String
    
    private enum CodingKeys: String, CodingKey {
        case address, city, state, country, email, phone, carrier
        
        case dropOffLocationId = "dropoff_id"
    }
    
}
