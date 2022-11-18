/// Represents the structure paginated Packaging are returned, featuring the page data.
public struct GetMultiplePackagingResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Packaging.
    public let packaging: [Packaging]
    
}
