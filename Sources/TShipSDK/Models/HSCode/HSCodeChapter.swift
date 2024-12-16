//
//  HSCodeChapter.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

public struct HSCodeChapter: Decodable {
    
    public let id: String
    
    public let chapterName: String
    
    public let keywords: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(String.self, forKey: .id)) ?? ""
        self.chapterName = (try? container.decode(String.self, forKey: .chapterName)) ?? ""
        self.keywords = (try? container.decode([String].self, forKey: .keywords)) ?? []
        
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "_id"
        
        case chapterName = "chapter_name"
        
        case keywords
        
    }
    
}
