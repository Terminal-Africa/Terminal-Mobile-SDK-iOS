//
//  RateMetadata.swift
//
//
//  Created by maxSpane on 16/05/2024.
//

public struct RateMetadata: Decodable {
    public let recommended: Bool?
    public let promoted: Bool?
    public let isPersonalAccountRate: Bool
    public let shipmentServiceCharge: Double
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recommended = try? container.decodeIfPresent(Bool.self, forKey: .recommended)
        self.isPersonalAccountRate = (try? container.decode(Bool.self, forKey: .isPersonalAccountRate)) ?? false
        self.shipmentServiceCharge = (try? container.decodeIfPresent(Double.self, forKey: .shipmentServiceCharge)) ?? 0
        self.promoted = try? container.decodeIfPresent(Bool.self, forKey: .promoted)
    }
    
    enum CodingKeys: String, CodingKey {
        case recommended, promoted
        case isPersonalAccountRate = "personal_account_rate"
        case shipmentServiceCharge = "shipment_service_charge"
    }
}
