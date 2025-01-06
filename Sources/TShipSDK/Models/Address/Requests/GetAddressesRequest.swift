//
//  GetAddressesRequest.swift
//  
//
//  Created by maxSpane on 15/02/2023.
//

public class GetAddressesRequest: PaginatedRequestBuilder {
    
    private var search: String?
    
    public init(search: String? = nil, perPage: Int = 15, page: Int = 1) {
        self.search = search
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(search, forKey: .search)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case search
    }
    
}
