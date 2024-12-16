/// Represents the response data for paginated populated shipments, featuring the page data.
public struct GetPopulatedShipmentsResponseData<T: Codable>: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Populated Shipments without Packaging data.
    public let shipments: [ShipmentPopulatedWithoutPackagingData<T>]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.shipments = (try? container.decode([ShipmentPopulatedWithoutPackagingData<T>].self, forKey: .shipments)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case shipments
    }
    
}
