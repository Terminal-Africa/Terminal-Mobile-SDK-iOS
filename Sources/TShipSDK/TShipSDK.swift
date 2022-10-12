public class TShipSDK {
    
    private let secretKey: String

    init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    public static var instance: TShipSDK?
    
    public static func createInstance(secretKey: String) -> TShipSDK {
        instance = TShipSDK(secretKey: secretKey)
        return instance!
    }
    
}
