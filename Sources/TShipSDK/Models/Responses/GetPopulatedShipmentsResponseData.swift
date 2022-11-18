/// Represents the response data for paginated shipments, featuring the page data.
public struct GetPopulatedShipmentsResponseData<T: Codable>: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Parcels.
    public let shipments: [ShipmentPopulatedWithoutPackagingData<T>]
    
}
