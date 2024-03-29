///Address data model containing all information needed about an Address to arrange a shipping.
public struct Address: Decodable, Equatable {
    
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
    
    /// Name of the state the address is located in
    public let state : String
    
    /// Zip code of the region the address is located in
    public let zipCode : String
    
    /// Indicates whether the address is a residential address
    public let isResidential: Bool
    
    /// Geographical Coordinates of the addresss
    public let coordinates: Coordinates
    
    public let tShopId: String?
    
    private enum CodingKeys : String, CodingKey {
        case addressId = "address_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone"
        case zipCode = "zip"
        case isResidential = "is_residential"
        case tShopId = "shop_ship"
        case city, country , email, line1, line2, state, coordinates
    }
    
    public static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.addressId == rhs.addressId && lhs.city == rhs.city && lhs.country == rhs.country && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.email == rhs.email && lhs.line1 == rhs.line1 && lhs.line2 == rhs.line2 && lhs.phoneNumber == rhs.phoneNumber && lhs.state == rhs.state && lhs.zipCode == rhs.zipCode && lhs.isResidential == rhs.isResidential && lhs.tShopId == rhs.tShopId
    }
    
}
