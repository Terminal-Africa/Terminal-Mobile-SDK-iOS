//
//  EnabledCarriers.swift
//  
//
//  Created by maxSpane on 25/01/2023.
//

public struct EnabledCarriers: Codable {
    
    /// List of ids for the carriers that are enabled for domestic shipments
    public let domestic: [String]
    
    /// List of ids for the carriers that are enabled for regional shipments
    public let regional: [String]
    
    /// List of ids for the carriers that are enabled for international shipments
    public let international: [String]
    
    init(domestic: [String], regional: [String], international: [String]) {
        self.domestic = domestic
        self.regional = regional
        self.international = international
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domestic = (try? container.decode([String].self, forKey: .domestic)) ?? []
        self.regional = (try? container.decode([String].self, forKey: .regional)) ?? []
        self.international = (try? container.decode([String].self, forKey: .international)) ?? []
    }
    
    enum CodingKeys: CodingKey {
        case domestic
        case regional
        case international
    }
    
}
