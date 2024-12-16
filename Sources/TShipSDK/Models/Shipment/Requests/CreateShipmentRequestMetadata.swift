//
//  CreateShipmentRequestMetadata.swift
//  
//
//  Created by maxSpane on 26/04/2023.
//

public struct CreateShipmentRequestMetadata: Encodable {
    public var tShopMetadata: TShopShipmentMetadata
    
    public init(tShopMetadata: TShopShipmentMetadata){
        self.tShopMetadata = tShopMetadata
    }
    
    private enum CodingKeys: String, CodingKey {
        case tShopMetadata = "tshop_metadata"
    }
    
}
