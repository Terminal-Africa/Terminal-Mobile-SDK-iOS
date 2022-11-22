/// Represents the response data for paginated carriers, featuring the page data.
public struct GetCarriersResponse: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Carriers.
    public let carriers: [Carrier]
    
}
