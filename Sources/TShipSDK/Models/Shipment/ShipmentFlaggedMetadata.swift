//
//  ShipmentFlaggedMetadata.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 27/03/2025.
//

public struct ShipmentFlaggedMetadata: Decodable {
    public let flagged: Bool
    public let title: String
    public let reason: String
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.flagged = (try container.decodeIfPresent(Bool.self, forKey: .flagged)) ?? false
        self.title = (try container.decodeIfPresent(String.self, forKey: .title)) ?? ""
        self.reason = (try container.decodeIfPresent(String.self, forKey: .reason)) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case flagged
        case title
        case reason
    }
}
