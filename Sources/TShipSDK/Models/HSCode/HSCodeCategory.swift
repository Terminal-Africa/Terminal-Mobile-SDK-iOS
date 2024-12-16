//
//  HSCodeCategory.swift
//  
//
//  Created by maxSpane on 23/08/2023.
//

public struct HSCodeCategory: Decodable {
    
    public let id: String
    
    public let name: String
    
    public let keywords: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(String.self, forKey: .id)) ?? ""
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.keywords = (try? container.decode([String].self, forKey: .keywords)) ?? []
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "_id"
        
        case name = "category"
        
        case keywords
        
    }
    
}
