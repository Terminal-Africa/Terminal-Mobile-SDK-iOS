/// Represents the response data for paginated addresses, featuring the page data.
public struct GetAddressResponseData: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Addresses.
    public let addresses: [Address]
    
}
