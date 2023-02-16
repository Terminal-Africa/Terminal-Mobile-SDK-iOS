//
//  GetShipmentsRequest.swift
//  
//
//  Created by maxSpane on 30/01/2023.
//

public class GetShipmentsRequest: PaginatedRequestBuilder {
    
    public let status: ShipmentStatus?
    
    public init(status: ShipmentStatus? = nil, perPage: Int = 15, page: Int = 1) {
        self.status = status
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
    }
}
