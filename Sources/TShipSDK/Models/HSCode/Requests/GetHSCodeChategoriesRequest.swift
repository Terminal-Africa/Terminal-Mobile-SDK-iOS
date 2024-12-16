//
//  GetHSCodeChategoriesRequest.swift
//
//
//  Created by maxSpane on 10/12/2023.
//

public class GetHSCodeCategoriesRequest: Encodable {
    
    var chapterId: String
    
    public init(chapterId: String) {
        self.chapterId = chapterId
    }
    
    private enum CodingKeys: String, CodingKey {
        case chapterId = "chapter"
    }
    
}
