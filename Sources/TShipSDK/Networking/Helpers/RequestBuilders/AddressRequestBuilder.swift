import Foundation

/// This class helps create the request body needed to create an address.
public class AddressRequestBuilder {
    
    /// The built request body for creating an address.
    private var request = [String: Any]()
    
    /// Default initializer taking in the required parameters for the create address request
    /// - Parameters:
    ///   - city: Name of the city the address is located in.
    ///   - country: Name of the country the address is located in.
    ///   - state: Name of the state the address is located in.
    public init (city: String, country: String, state: String){
        request[PARAM_CITY] = city
        request[PARAM_COUNTRY] = country
        request[PARAM_STATE] = state
    }
    
    /// This function adds the details for the user at the address to the request.
    /// - Parameters:
    ///   - firstName: First Name of the person at the location.
    ///   - lastName: Last Name of the person at the location.
    ///   - email: Email of the person at the location.
    ///   - phone: Phone number of the person at the location.
    @discardableResult
    public func withDetailsForUserAtAddress(firstName: String, lastName: String, email: String, phone: String) -> AddressRequestBuilder {
        request[PARAM_EMAIL] = email
        request[PARAM_FIRST_NAME] = firstName
        request[PARAM_LAST_NAME] = lastName
        request[PARAM_PHONE] = phone
        return self
    }
    
    /// This function adds the address lines to the request.
    /// - Parameters:
    ///   - line1: Line1 of the Address.
    ///   - line2: Line2 of the Address. This value is optional so you can just ignore it.
    @discardableResult
    public func withAddressLines(line1: String, line2: String? = nil) -> AddressRequestBuilder {
        request[PARAM_LINE1] = line1
        if let line2 = line2 {
            request[PARAM_LINE2] = line2
        }
        return self
    }
    
    /// This function adds the Address's zip code to the request.
    /// - Parameters:
    ///   - zipCode: Zip code of the region the address is located in.
    @discardableResult
    public func withZipCode(_ zipCode: String) -> AddressRequestBuilder {
        request[PARAM_ZIP] = zipCode
        return self
    }
    
    /// This function sets whether the address is a residential address or not. This defaults to true if not set.
    /// - Parameters:
    ///   - isResidential: Indicates whether the address is a residential address.
    @discardableResult
    public func isResidential(_ isResidential: Bool) -> AddressRequestBuilder {
        request[PARAM_IS_RESIDENTIAL] = isResidential
        return self
    }
    
    /// This function adds  metadata to add to the address object.
    /// - Parameters:
    ///   - metadata: This function adds metadata to the address.
    @discardableResult
    public func withMetaData(_ metadata: [String: Any]) -> AddressRequestBuilder {
        request[PARAM_METADATA] = metadata
        return self
    }
    
    /// This function returns the built create address request.
    /// - Returns: [String:  Any] a dictionary containing the parameters provided to the builder.
    public func build() -> [String: Any] {
        return request
    }
    
    private let PARAM_IS_RESIDENTIAL = "is_residential"
    private let PARAM_CITY = "city"
    private let PARAM_STATE = "state"
    private let PARAM_COUNTRY = "country"
    private let PARAM_EMAIL = "email"
    private let PARAM_FIRST_NAME = "first_name"
    private let PARAM_LAST_NAME = "last_name"
    private let PARAM_LINE1 = "line1"
    private let PARAM_LINE2 = "line2"
    private let PARAM_NAME = "name"
    private let PARAM_PHONE = "phone"
    private let PARAM_ZIP = "zip"
    private let PARAM_METADATA = "metadata"
    
}
