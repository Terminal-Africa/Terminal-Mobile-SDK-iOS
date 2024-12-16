/// Represents the response data for paginated parcels, featuring the page data.
public struct GetParcelsResponseData<T: Codable>: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Parcels.
    public let parcels: [ParcelWithoutPackagingData<T>]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.parcels = (try? container.decode([ParcelWithoutPackagingData<T>].self, forKey: .parcels)) ?? []
    }
    
    enum CodingKeys: CodingKey {
        case pagination
        case parcels
    }
    
}
