//
//  ShipmentMetadata.swift
//  
//
//  Created by maxSpane on 29/03/2023.
//

public struct ShipmentMetadata: Decodable{
    
    public let selectedRate: SelectedRate?
    public let tShopMetadata: TShopShipmentMetadata?
    
    public init(tShopMetadata: TShopShipmentMetadata?) {
        self.tShopMetadata = tShopMetadata
        selectedRate = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case selectedRate = "selected_rate"
        case tShopMetadata = "tshop_metadata"
    }
    
}
