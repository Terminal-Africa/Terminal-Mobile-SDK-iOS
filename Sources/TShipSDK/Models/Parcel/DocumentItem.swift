//
//  Document.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/03/2026.
//

public struct DocumentItem: Decodable {
    public let name: String
    public let hsCode: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case hsCode = "hs_code"
    }
}
