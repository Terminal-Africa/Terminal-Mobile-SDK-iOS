//
//  GetDropOffLocationsRequest.swift
//  
//
//  Created by maxSpane on 11/08/2023.
//

public struct GetDropOffLocationsRequest: Encodable {
    
    public var city: String?
    
    public var state: String?
    
    public var country: String
    
    public var carrierSlug: String
    
    public init(city: String? = nil, state: String? = nil, country: String, carrierSlug: String) {
        self.city = city
        self.state = state
        self.country = country
        self.carrierSlug = carrierSlug
    }
    
    enum CodingKeys: String, CodingKey {
        
        case city, state, country
        
        case carrierSlug = "carrier"
        
    }
    
}
