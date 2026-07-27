//
//  HSCode.swift
//  
//
//  Created by maxSpane on 23/08/2023.
//

/// A Harmonized System classification code and its catalogue hierarchy.
public struct HSCode: Decodable {
    
    public let chapterCode: String
    
    public let chapterName: String
    
    public let categoryName: String
    
    public let categoryCode: String
    
    public let subCategoryName: String
    
    public let keywords: String?
    
    public let hsCode: String
    
    public let hsCodeId: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chapterCode = (try? container.decode(String.self, forKey: .chapterCode)) ?? ""
        self.chapterName = (try? container.decode(String.self, forKey: .chapterName)) ?? ""
        self.categoryName = (try? container.decode(String.self, forKey: .categoryName)) ?? ""
        self.categoryCode = (try? container.decode(String.self, forKey: .categoryCode)) ?? ""
        self.subCategoryName = (try? container.decode(String.self, forKey: .subCategoryName)) ?? ""
        self.keywords = (try? container.decode(String.self, forKey: .keywords)) ?? ""
        self.hsCode = (try? container.decode(String.self, forKey: .hsCode)) ?? ""
        self.hsCodeId = (try? container.decode(String.self, forKey: .hsCodeId)) ?? ""
    }
    
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
