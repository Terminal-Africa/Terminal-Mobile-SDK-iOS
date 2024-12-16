//
//  SearchHSCodeRequest.swift
//  
//
//  Created by maxSpane on 23/08/2023.
//

public class SearchHSCodeRequest: PaginatedRequestBuilder {
    
    public var searchString: String
    
    public var chapterCode: String?
    
    public var categoryCode: String?
    
    public init(searchString: String = "", perPage: Int = 15, page: Int = 1) {
        self.searchString = searchString
        super.init(perPage: perPage, page: page)
    }
    
    public func withChapterCode(chapterCode: String) -> SearchHSCodeRequest{
        self.chapterCode = chapterCode
        return self
    }
    
    public func withCategoryCode(categoryCode: String) -> SearchHSCodeRequest{
        self.categoryCode = categoryCode
        return self
    }
    
    public func withSearchString(searchString: String) -> SearchHSCodeRequest{
        self.searchString = searchString
        return self
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(searchString, forKey: .searchString)
        try container.encodeIfPresent(chapterCode, forKey: .chapterCode)
        try container.encodeIfPresent(categoryCode, forKey: .categoryCode)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case searchString = "query_string"
        
        case chapterCode = "chapter"
        
        case categoryCode = "category_code"
        
    }
    
}
