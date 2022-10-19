import Foundation

/// This class helps create the request body needed to create an address.
public class CreateAddressRequestBuilder {
    
    /// The built request body for creating an address.
    private var request = [String: Any]()
    
    /// Default initializer taking in the required parameters for the create address request
    public init (city: String, country: String, state: String){
        request[PARAM_CITY] = city
        request[PARAM_COUNTRY] = country
        request[PARAM_STATE] = state
    }
    
    /// This function adds the details for the user at the address to the request.
    @discardableResult
    public func withDetailsForUserAtAddress(firstName: String, lastName: String, email: String, phone: String) -> CreateAddressRequestBuilder {
        request[PARAM_EMAIL] = email
        request[PARAM_FIRST_NAME] = firstName
        request[PARAM_LAST_NAME] = lastName
        request[PARAM_PHONE] = phone
        return self
    }
    
    /// This function adds the address lines to the request.
    @discardableResult
    public func withAddressLines(line1: String, line2: String? = nil) -> CreateAddressRequestBuilder {
        request[PARAM_LINE1] = line1
        if let line2 = line2 {
            request[PARAM_LINE2] = line2
        }
        return self
    }
    
    /// This function adds the Address's zip code to the request.
    @discardableResult
    public func withZipCode(_ zipCode: String) -> CreateAddressRequestBuilder {
        request[PARAM_ZIP] = zipCode
        return self
    }
    
    /// This function sets whether the address is a residential address or not. This defaults to true if not set.
    @discardableResult
    public func isResidential(_ isResidential: Bool) -> CreateAddressRequestBuilder {
        request[PARAM_IS_RESIDENTIAL] = isResidential
        return self
    }
    
    /// This function helps add metadata to add to the address object.
    @discardableResult
    public func withMetaData(_ metadata: [String: Any]) -> CreateAddressRequestBuilder {
        request[PARAM_METADATA] = metadata
        return self
    }
    
    /// This function returns the built create address request.
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
