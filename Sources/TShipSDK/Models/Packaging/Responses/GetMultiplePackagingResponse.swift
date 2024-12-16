/// Represents the structure paginated Packaging are returned, featuring the page data.
public struct GetMultiplePackagingResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Packaging.
    public let packaging: [Packaging]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.packaging = (try? container.decode([Packaging].self, forKey: .packaging)) ?? []
    }
    
    enum CodingKeys: CodingKey {
        case pagination
        case packaging
    }
    
}
