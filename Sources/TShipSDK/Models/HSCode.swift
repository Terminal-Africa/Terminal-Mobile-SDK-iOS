//
//  HSCode.swift
//  
//
//  Created by maxSpane on 23/08/2023.
//

public struct HSCode: Decodable {
    
    public let chapterCode: String
    
    public let chapterName: String
    
    public let categoryName: String
    
    public let categoryCode: String
    
    public let subCategoryName: String
    
    public let keywords: String
    
    public let hsCode: String
    
    public let hsCodeId: String
    
    private enum CodingKeys: String, CodingKey {
        
        case chapterCode = "chapter"
        
        case chapterName = "chapter_name"
        
        case categoryName = "category"
        
        case categoryCode = "category_code"
        
        case subCategoryName = "sub_category"
        
        case hsCode = "hs_code"
        
        case hsCodeId = "hs_code_id"
        
        case keywords
        
    }
    
}
