/// Represents the response data for paginated shipments, featuring the page data.
public struct GetShipmentsResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Shipments.
    public let shipments: [ShipmentUnpopulated]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.shipments = (try? container.decode([ShipmentUnpopulated].self, forKey: .shipments)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case shipments
    }
    
}
