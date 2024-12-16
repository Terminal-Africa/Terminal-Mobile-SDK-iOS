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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.originalShipmentAmount = try? container.decodeIfPresent(Double.self, forKey: .originalShipmentAmount)
        self.discountApplied = try? container.decodeIfPresent(Bool.self, forKey: .discountApplied)
        self.discount = try? container.decodeIfPresent(Double.self, forKey: .discount)
    }
    
    private enum CodingKeys: String, CodingKey {
        case originalShipmentAmount = "original_shipment_amount"
        case discountApplied = "discount_applied"
        case discount
    }
}
