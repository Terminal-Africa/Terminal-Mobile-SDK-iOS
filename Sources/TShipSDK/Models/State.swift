/// State data model containing details about a State.
public struct State: Codable {
    
    /// The name of the state.
    public let name: String
    
    /// The iso code of the state.
    public let isoCode: String
    
    /// The country code of the country the state is in.
    public let countryCode: String
    
    /// The state's latitude.
    public let latitude: String
    
    /// The state's longitude.
    public let longitude: String
}
