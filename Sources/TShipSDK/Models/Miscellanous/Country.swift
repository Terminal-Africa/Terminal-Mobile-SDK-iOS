/// Country data model containing in formation about a country.
public struct Country: Codable, Equatable {
    
    public static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.isoCode == rhs.isoCode
    }
    
    /// The country's iso code.
    public let isoCode: String
    
    /// The name of the country.
    public let name: String
    
    /// The country's phone number code.
    public let phoneCode: String
    
    /// An emoji of the country's Flag.
    public let flag: String
    
    /// The country's currency.
    public let currency: String
    
    /// The country's latitude.
    public let latitude: String
    
    /// The country's longitude.
    public let longitude: String
    
    /// The details about the timezones that are in the country.
    public let timezones: [Timezone]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isoCode = (try? container.decode(String.self, forKey: .isoCode)) ?? ""
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.phoneCode = (try? container.decode(String.self, forKey: .phoneCode)) ?? ""
        self.flag = (try? container.decode(String.self, forKey: .flag)) ?? ""
        self.currency = (try? container.decode(String.self, forKey: .currency)) ?? ""
        self.latitude = (try? container.decode(String.self, forKey: .latitude)) ?? ""
        self.longitude = (try? container.decode(String.self, forKey: .longitude)) ?? ""
        self.timezones = (try? container.decode([Timezone].self, forKey: .timezones)) ?? []
    }
    
    private enum CodingKeys : String, CodingKey {
        case phoneCode = "phonecode"
        case isoCode, name, flag, currency, latitude, longitude, timezones
    }
    
}
