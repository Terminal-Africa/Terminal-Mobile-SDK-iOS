/// Data model containing information about a Carrier.
public struct Carrier: Codable {
    
    /// The Carrier's name.
    public let name: String
    
    /// A Url to the carrier's logo.
    public let logo: String
    
    /// A unique slug used to identify the carrier.
    public let slug: String
    
    /// A unique string used to identify the carrier.
    public let carrierId: String
    
    private enum CodingKeys: String, CodingKey {
        case carrierId = "carrier_id"
        case name, logo, slug
    }
    
}
