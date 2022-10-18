public class TShipSDK {
    
    private let secretKey: String
    
    private let addressesRemote = AddresssesRemote()

    init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    public static var instance: TShipSDK?
    
    @discardableResult
    public static func createInstance(secretKey: String) -> TShipSDK {
        instance = TShipSDK(secretKey: secretKey)
        return instance!
    }
    
    //For Address Endpoints
    
    public func createAddress(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.createAddress(secretKey: secretKey, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
