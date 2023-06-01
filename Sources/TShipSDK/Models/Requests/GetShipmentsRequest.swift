//
//  GetShipmentsRequest.swift
//  
//
//  Created by maxSpane on 30/01/2023.
//

public class GetShipmentsRequest: PaginatedRequestBuilder {
    
    public var status: ShipmentStatus?
    
    public var shipmentType: ShipmentType?
    
    public init(status: ShipmentStatus? = nil, perPage: Int = 15, page: Int = 1, shipmentType: ShipmentType? = nil) {
        self.status = status
        self.shipmentType = shipmentType
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(shipmentType, forKey: .shipmentType)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentType = "type"
        case status
    }
}
