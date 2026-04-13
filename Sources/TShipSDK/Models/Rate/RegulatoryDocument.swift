//
//  RegulatoryDoc.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/12/2025.
//

public struct RegulatoryDocument: Decodable {
    public let type: String
    public let name: String?
    public let amount: Double?
    public let documentUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
        case amount
        case documentUrl = "document_url"
    }
}
