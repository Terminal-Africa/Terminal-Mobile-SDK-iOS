/// Represents the response data for paginated populated shipments, featuring the page data.
public struct GetPopulatedShipmentsResponseData<T: Codable>: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Populated Shipments without Packaging data.
    public let shipments: [ShipmentPopulatedWithoutPackagingData<T>]
    
}
