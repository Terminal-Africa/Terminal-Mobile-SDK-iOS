//
//  GetAddressesRequest.swift
//  
//
//  Created by maxSpane on 15/02/2023.
//

public class GetAddressesRequest: PaginatedRequestBuilder {
    
    private var search: String?
    private var type: AddressType?
    
    public init(search: String? = nil, type: AddressType? = nil, perPage: Int = 15, page: Int = 1) {
        self.search = search
        self.type = type
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(type, forKey: .type)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case search, type
    }
    
}
