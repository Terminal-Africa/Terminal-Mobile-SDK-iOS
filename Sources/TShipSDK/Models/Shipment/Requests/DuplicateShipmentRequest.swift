//
//  DuplicateShipmentRequest.swift
//
//
//  Created by maxSpane on 16/11/2023.
//

public struct DuplicateShipmentRequest: Encodable {
    
    public let shipmentId: String
    
    public let populate: Bool
    
    public init(shipmentId: String, populate: Bool) {
        self.shipmentId = shipmentId
        self.populate = populate
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case populate
    }
    
}
