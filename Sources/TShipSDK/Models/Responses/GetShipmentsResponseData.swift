/// Represents the response data for paginated shipments, featuring the page data.
public struct GetShipmentsResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Shipments.
    public let shipments: [ShipmentUnpopulated]
    
}
