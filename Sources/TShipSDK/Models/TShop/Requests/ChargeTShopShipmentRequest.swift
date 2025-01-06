//
//  ChargeTShopShipmentRequest.swift
//  
//
//  Created by maxSpane on 28/04/2023.
//

public struct ChargeTShopShipmentRequest: Encodable {
    
    public var shipmentId: String
    
    public init(shipmentId: String){
        self.shipmentId = shipmentId
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
    }
}
