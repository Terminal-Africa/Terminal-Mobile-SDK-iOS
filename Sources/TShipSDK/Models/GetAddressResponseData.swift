/// Represents the structure paginated data are returned, featuring the page data.
public struct GetAddressResponseData: Codable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Addresses.
    public let addresses: [Address]
    
}
