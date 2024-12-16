//
//  RateMetadata.swift
//
//
//  Created by maxSpane on 16/05/2024.
//

public struct RateMetadata: Decodable {
    public let recommended: Bool?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recommended = try? container.decodeIfPresent(Bool.self, forKey: .recommended)
    }
    
    enum CodingKeys: String, CodingKey {
        case recommended
    }
}
