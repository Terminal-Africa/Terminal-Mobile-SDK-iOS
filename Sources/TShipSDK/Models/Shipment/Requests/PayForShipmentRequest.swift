//
//  PayForShipmentRequest.swift
//  Terminal Africa
//
//  Created by Mohammed Adetunji on 21/03/2025.
//

public struct PayForShipmentRequest: Encodable {
    let shipmentId: String
    
    public init(shipmentId: String) {
        self.shipmentId = shipmentId
    }
    
    enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
    }
}
