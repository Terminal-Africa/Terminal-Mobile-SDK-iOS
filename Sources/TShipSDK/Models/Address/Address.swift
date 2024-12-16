///Address data model containing all information needed about an Address to arrange a shipping.
public struct Address: Codable, Equatable {
    
    /// Unique id used to identify the address
    public let addressId : String
    
    /// Name of the city the address is located in
    public let city : String
    
    /// Name of the country the address is located in
    public let country : String
    
    /// First Name of the person at the location
    public let firstName : String
    
    /// Last Name of the person at the location
    public let lastName : String
    
    /// Email of the person at the location
    public let email : String
    
    /// Line1 of the Address
    public let line1 : String
    
    /// Line2 of the Address
    public let line2 : String
    
    /// Phone number of the person at the location
    public let phoneNumber : String
    
    /// Alternate Phone number of the person at the location
    public let altPhoneNumber : String
    
    /// Name of the state the address is located in
    public let state : String
    
    /// Zip code of the region the address is located in
    public let zipCode : String
    
    /// Indicates whether the address is a residential address
    public let isResidential: Bool
    
    /// Geographical Coordinates of the addresss
    public let coordinates: Coordinates
    
    public let tShopId: String?
    
    public let alias: String?
    
    public let createdAt: String
    
    public let updatedAt: String
    
    private enum CodingKeys : String, CodingKey {
        case addressId = "address_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone"
        case altPhoneNumber = "alt_phone"
        case zipCode = "zip"
        case isResidential = "is_residential"
        case tShopId = "shop_ship"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case city, country , email, line1, line2, state, coordinates, alias
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addressId = try container.decodeIfPresent(String.self, forKey: .addressId) ?? ""
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber) ?? ""
        self.altPhoneNumber = try container.decodeIfPresent(String.self, forKey: .altPhoneNumber) ?? ""
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode) ?? ""
        self.isResidential = try container.decodeIfPresent(Bool.self, forKey: .isResidential) ?? true
        self.coordinates = (try? container.decodeIfPresent(Coordinates.self, forKey: .coordinates)) ?? .init(lat: 0, lng: 0)
        self.tShopId = try container.decodeIfPresent(String.self, forKey: .tShopId) ?? ""
        self.alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.line1 = try container.decodeIfPresent(String.self, forKey: .line1) ?? ""
        self.line2 = try container.decodeIfPresent(String.self, forKey: .line2) ?? ""
    }
    
    public static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.addressId == rhs.addressId && lhs.city == rhs.city && lhs.country == rhs.country && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.email == rhs.email && lhs.line1 == rhs.line1 && lhs.line2 == rhs.line2 && lhs.phoneNumber == rhs.phoneNumber && lhs.altPhoneNumber == rhs.altPhoneNumber && lhs.state == rhs.state && lhs.zipCode == rhs.zipCode && lhs.isResidential == rhs.isResidential && lhs.tShopId == rhs.tShopId && lhs.alias == rhs.alias && lhs.updatedAt == rhs.updatedAt
    }
    
}
