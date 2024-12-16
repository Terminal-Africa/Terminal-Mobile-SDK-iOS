//
//  GetHSCodesRequest.swift
//
//
//  Created by maxSpane on 10/12/2023.
//


public class GetHSCodesRequest: PaginatedRequestBuilder {
    
    public var chapterCode: String?
    
    public var categoryCode: String?
    
    public func withChapterCode(chapterCode: String) -> GetHSCodesRequest{
        self.chapterCode = chapterCode
        return self
    }
    
    public func withCategoryCode(categoryCode: String) -> GetHSCodesRequest{
        self.categoryCode = categoryCode
        return self
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(chapterCode, forKey: .chapterCode)
        try container.encodeIfPresent(categoryCode, forKey: .categoryCode)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case chapterCode = "chapter"
        
        case categoryCode = "category_code"
        
    }
    
}

