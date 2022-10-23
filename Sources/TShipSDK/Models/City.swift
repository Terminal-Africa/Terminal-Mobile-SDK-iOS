/// City data model containing details about a City
public struct City: Codable {
    
    /// The name of the city.
    public let name: String
    
    /// The iso code of the state the city is in.
    public let stateCode: String
    
    /// The iso code of the country the city is in.
    public let countryCode: String
    
    /// The city's latitude.
    public let latitude: String
    
    /// The city's longitude.
    public let longitude: String
}
