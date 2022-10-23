/// The TShipSDK class allows you to perform any operation you would want to perform on TShipAPI.
public class TShipSDK {
    
    /// User's TShipAPI Secret key
    let secretKey: String
    
    /// Instance of AddressRemote class for performing remote operations that involve Addresses.
    let addressesRemote = AddresssesRemote()
    
    /// Instance of MiscellanousRemote class for performing miscellanous remote operations.
    let miscellanousRemote = MiscellanousRemote()
    
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
    
}
