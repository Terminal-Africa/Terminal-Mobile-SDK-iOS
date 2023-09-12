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
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "_id"
        
        case name = "category"
        
        case keywords
        
    }
    
}
