//
//  RateBreakdown.swift
//
//
//  Created by maxSpane on 21/09/2023.
//

public struct RateBreakdown: Codable {
    public let originalShipmentAmount: Double?
    public let discountApplied: Bool?
    public let discount: Double?
    
    private enum CodingKeys: String, CodingKey {
        case originalShipmentAmount = "original_shipment_amount"
        case discountApplied = "discount_applied"
        case discount
    }
}
