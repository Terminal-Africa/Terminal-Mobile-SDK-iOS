///  This class helps create the request body needed to fetch States in a Country or Cities in a State.
public class CityOrStateRequestBuilder{
    
    /// The built request body for fetching states or cities.
    private var request = [String: Any]()
    
    /// Default initializer taking in the required parameters for quering the city and state requests.
    /// - Parameters:
    ///   - countryCode: The country code of the country whose states or cities you want to fetch.
    ///   - stateCode: The state code of the state whose cities you want to fetch. Can  be omitted if you want to fetch list of states.
    public init (countryCode: String, stateCode: String? = nil){
        request[PARAM_COUNTRY_CODE] = countryCode
        if let stateCode = stateCode{
            request[PARAM_STATE_CODE] = stateCode
        }
    }
    
    /// This function adds the country code to use in request.
    /// - Parameters:
    ///   - countryCode: The country code of the country whose states or cities you want to fetch.
    @discardableResult
    public func withCountryCode(_ countryCode: String) -> CityOrStateRequestBuilder {
        request[PARAM_COUNTRY_CODE] = countryCode
        return self
    }
    
    /// This function adds the state code to use in request.
    /// - Parameters:
    ///   - countryCode: The state code of the state whose cities you want to fetch. Can  be omitted if you want to fetch list of states.
    @discardableResult
    public func withStateCode(_ stateCode: String) -> CityOrStateRequestBuilder {
        request[PARAM_STATE_CODE] = stateCode
        return self
    }
    
    /// This function returns the built create address request.
    /// - Returns: [String:  Any] a dictionary containing the parameters provided to the builder.
    public func build() -> [String: Any] {
        return request
    }
    
    private let PARAM_COUNTRY_CODE = "country_code"
    private let PARAM_STATE_CODE = "state_code"
    
}
