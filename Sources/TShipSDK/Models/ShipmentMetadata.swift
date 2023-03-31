//
//  ShipmentMetadata.swift
//  
//
//  Created by maxSpane on 29/03/2023.
//

public struct ShipmentMetadata: Decodable{
    
    public let selectedRate: SelectedRate?
    
    enum CodingKeys: String, CodingKey {
        case selectedRate = "selected_rate"
    }
    
}
