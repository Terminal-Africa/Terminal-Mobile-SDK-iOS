//
//  GetCustomDuty.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/12/2025.
//

public struct CalculateDutyFeeRequest: Encodable {
    public let shipmentId: String
    
    public init(shipmentId: String) {
        self.shipmentId = shipmentId
    }
    
    enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
    }
}
