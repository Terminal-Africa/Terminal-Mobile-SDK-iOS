//
//  SearchHSCodesResponse.swift
//  
//
//  Created by maxSpane on 23/08/2023.
//

public struct SearchHSCodesResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Parcels.
    public let hsCodes: [HSCode]
    
    private enum CodingKeys: String, CodingKey {
        case hsCodes = "hs_codes"
        case pagination
    }
}
