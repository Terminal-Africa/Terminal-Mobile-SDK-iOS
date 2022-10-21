/// The TShipSDK class allows you to perform any operation you would want to perform on TShipAPI.
public class TShipSDK {
    
    /// User's TShipAPI Secret key
    private let secretKey: String
    
    /// Instance of AddressRemote class for performing remote operations that involve Addresses.
    private let addressesRemote = AddresssesRemote()
    
    /// Initializes the TShipSDK with secret key which is required for all calls to the TShipAPI.
    init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    /// Saves a static instance of the TShipSDK class so it only needs to be intialized once.
    public static var instance: TShipSDK?
    
    /// This function is used to create the static instance of TShipSDK
    @discardableResult
    public static func createInstance(secretKey: String) -> TShipSDK {
        instance = TShipSDK(secretKey: secretKey)
        return instance!
    }
    
    //For Address Endpoints
    
    /// This function creates an Address on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create Address. This should be created with the AddressRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    public func createAddress(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.createAddress(secretKey: secretKey, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of an  Address on the TShip API.
    /// - Parameters:
    ///   - addressId: Unique id used to identify the address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    public func getAddress(addressId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.getAddress(secretKey: secretKey, addressId: addressId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches Addresses previously created on the TShip API.
    /// - Parameters:
    ///   - request: Should contain the query parameters for paginating through the Addresses. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    public func getAddresses(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetAddressResponseData, Error>) -> Void){
        addressesRemote.getAddresses(secretKey: secretKey, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This updates an Address previously created on the TShip API.
    /// - Parameters:
    ///   - addressId: Unique id used to identify the address.
    ///   - request: Request body with the Address details you want to update. This should be created with the AddressRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the updated Address if no error occurred.
    public func updateAddress(addressId: String, request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.updateAddress(secretKey: secretKey, addressId: addressId, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
