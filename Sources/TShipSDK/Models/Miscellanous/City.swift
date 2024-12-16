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
    
    init(name: String, stateCode: String, countryCode: String, latitude: String, longitude: String) {
        self.name = name
        self.stateCode = stateCode
        self.countryCode = countryCode
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.stateCode = (try? container.decode(String.self, forKey: .stateCode)) ?? ""
        self.countryCode = (try? container.decode(String.self, forKey: .countryCode)) ?? ""
        self.latitude = (try? container.decode(String.self, forKey: .latitude)) ?? ""
        self.longitude = (try? container.decode(String.self, forKey: .longitude)) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case stateCode
        case countryCode
        case latitude
        case longitude
    }
}
