//
//  HSCodeChapter.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

public struct HSCodeChapter: Decodable {
    
    public let id: String
    
    public let chapterName: String
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "_id"
        
        case chapterName = "chapter_name"
        
    }
    
}
