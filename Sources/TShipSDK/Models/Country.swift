/// Country data model containing in formation about a country.
public struct Country: Codable {
    
    /// The country's iso code.
    public let isoCode: String
    
    /// The name of the country.
    public let name: String
    
    /// The country's phone number code.
    public let phoneCode: String
    
    /// An emoji of the country's Flag.
    public let flag: String
    
    /// An emoji of the country's Flag.
    public let currency: String
    
    /// The country's latitude.
    public let latitude: String
    
    /// The country's longitude.
    public let longitude: String
    
    /// The details about the timezones that are in the country.
    public let timezones: [Timezone]
    
    private enum CodingKeys : String, CodingKey {
        case phoneCode = "phonecode"
        case isoCode, name, flag, currency, latitude, longitude, timezones
    }
    
}
