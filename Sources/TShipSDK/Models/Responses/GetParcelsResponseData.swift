/// Represents the response data for paginated parcels, featuring the page data.
public struct GetParcelsResponseData<T: Codable>: Codable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Parcels.
    public let parcels: [Parcel<T>]
    
}
