/// Represents the response data for paginated addresses, featuring the page data.
public struct GetAddressResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Addresses.
    public let addresses: [Address]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.addresses = (try? container.decode([Address].self, forKey: .addresses)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case addresses
    }
    
}
