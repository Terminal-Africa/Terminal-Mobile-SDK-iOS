/// Represents the response data for paginated carriers, featuring the page data.
public struct GetCarriersResponse: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Carriers.
    public let carriers: [Carrier]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.carriers = (try? container.decode([Carrier].self, forKey: .carriers)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case carriers
    }
    
}
