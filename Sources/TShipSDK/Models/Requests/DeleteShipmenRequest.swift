//
//  DeleteShipmenRequest.swift
//
//
//  Created by maxSpane on 16/11/2023.
//

public struct DeleteShipmenRequest: Encodable {
    public let shipmentId: String
    
    public init(shipmentId: String) {
        self.shipmentId = shipmentId
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
    }
}
