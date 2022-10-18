//
//  File.swift
//  
//
//  Created by Mac on 14/10/2022.
//

import Foundation

public struct Address: Codable {
    
    public let addressId, city, country, firstName, lastName, email, line1, line2, phoneNumber, state, zipCode : String
    public let coordinates: Coordinates
    public let isResidential: Bool
    
    private enum CodingKeys : String, CodingKey {
        case addressId = "address_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone"
        case zipCode = "zip"
        case isResidential = "is_residential"
        case city, country , email, line1, line2, state, coordinates
    }
}
