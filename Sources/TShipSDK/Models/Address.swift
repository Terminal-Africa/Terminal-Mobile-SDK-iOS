import Foundation

///Address data model containing all information needed about an Address to arrange a shipping.
public struct Address: Codable {
    
    public let addressId : String
    public let city : String
    public let country : String
    public let firstName : String
    public let lastName : String
    public let email : String
    public let line1 : String
    public let line2 : String
    public let phoneNumber : String
    public let state : String
    public let zipCode : String
    public let coordinates: Coordinates
    public let isResidential: Bool
    
    private enum CodingKeys : String, CodingKey {
        case addressId = "address_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone"
        case zipCode = "zip"
        case isResidential = "is_residential"
        case city, country , email, line1, line2, state, coordinates
    }
}
