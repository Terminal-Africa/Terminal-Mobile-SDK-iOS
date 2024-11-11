//
//  RateMetadata.swift
//
//
//  Created by maxSpane on 16/05/2024.
//

public struct RateMetadata: Decodable {
    public let recommended: Bool?
    
    enum CodingKeys: String, CodingKey {
        case recommended
    }
}
