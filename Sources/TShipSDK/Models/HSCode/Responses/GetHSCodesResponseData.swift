//
//  GetHSCodesResponseData.swift
//
//
//  Created by maxSpane on 11/12/2023.
//

public struct GetHSCodesResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Parcels.
    public let hsCodes: [HSCode]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.hsCodes = (try? container.decode([HSCode].self, forKey: .hsCodes)) ?? []
    }
    
    private enum CodingKeys: String, CodingKey {
        case hsCodes = "hs_codes"
        case pagination
    }
    
}
