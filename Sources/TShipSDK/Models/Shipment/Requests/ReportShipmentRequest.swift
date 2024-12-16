//
//  ReportShipmentRequest.swift
//  
//
//  Created by maxSpane on 28/04/2023.
//

public struct ReportShipmentRequest: Encodable {
    
    public var shipmentId: String
    public var comment: String
    
    public init(shipmentId: String, comment: String){
        self.shipmentId = shipmentId
        self.comment = comment
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case comment = "comment"
    }
    
}
