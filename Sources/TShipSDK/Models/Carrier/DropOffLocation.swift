//
//  DropoffLocation.swift
//  
//
//  Created by maxSpane on 11/08/2023.
//

public struct DropOffLocation: Decodable {
    
    public let address: String
    
    public let city: String
    
    public let state: String
    
    public let country: String
    
    public let dropOffLocationId: String
    
    public let email: String
    
    public let phone: String
    
    public let carrier: String
    
    public let distance: Double?
    
    public let isTerminalDropOffLocation: Bool
    
    private enum CodingKeys: String, CodingKey {
        case address, city, state, country, email, phone, carrier, distance
        
        case dropOffLocationId = "dropoff_id"
        
        case isTerminalDropOffLocation = "terminal_dropoff"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = (try? container.decode(String.self, forKey: .address)) ?? ""
        self.city = (try? container.decode(String.self, forKey: .city)) ?? ""
        self.state = (try? container.decode(String.self, forKey: .state)) ?? ""
        self.country = (try? container.decode(String.self, forKey: .country)) ?? ""
        self.dropOffLocationId = (try? container.decode(String.self, forKey: .dropOffLocationId)) ?? ""
        self.email = (try? container.decode(String.self, forKey: .email)) ?? ""
        self.phone = (try? container.decode(String.self, forKey: .phone)) ?? ""
        self.carrier = (try? container.decode(String.self, forKey: .carrier)) ?? ""
        self.distance = try? container.decode(Double.self, forKey: .distance)
        self.isTerminalDropOffLocation = (try? container.decode(Bool.self, forKey: .isTerminalDropOffLocation)) ?? false
    }
}
