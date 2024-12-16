//
//  GetShipmentsRequest.swift
//  
//
//  Created by maxSpane on 30/01/2023.
//

public class GetShipmentsRequest: PaginatedRequestBuilder {
    
    public var status: ShipmentStatus?
    
    public var shipmentType: ShipmentType?
    
    /// The start date for the date range you want to filter the transactions by.
    public var startDate: String?
    
    /// The end date for the date range you want to filter the transactions by.
    public var endDate: String?
    
    public init(status: ShipmentStatus? = nil, startDate: String? = nil, endDate: String? = nil, perPage: Int = 15, page: Int = 1, shipmentType: ShipmentType? = nil) {
        self.status = status
        self.shipmentType = shipmentType
        self.startDate = startDate
        self.endDate = endDate
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(shipmentType, forKey: .shipmentType)
        try container.encodeIfPresent(startDate, forKey: .startDate)
        try container.encodeIfPresent(endDate, forKey: .endDate)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentType = "type"
        case status
        case startDate = "start_date"
        case endDate = "end_date"
    }
}
