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
    ///   - request: Request body with details used to create Address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    /// - Returns: URLRequest
    public func createAddress(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.createAddress(secretKey: secretKey, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
