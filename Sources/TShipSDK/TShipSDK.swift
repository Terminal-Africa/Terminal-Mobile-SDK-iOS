
let TSHIP_API_LIVE_ENV_BASE_URL = "https://api.terminal.africa/v1"
let TSHIP_API_DEV_ENV_BASE_URL = "https://sandbox.terminal.africa/v1"


/// The TShipSDK class allows you to perform any operation you would want to perform on TShipAPI.
public class TShipSDK {
    
    /// User's TShipAPI Secret key
    private let secretKey: String
    
    /// Determine whether or not to use the Live or Development Environment of the TShip API.
    private let useLiveEnvironment: Bool
    
    /// The Base Url to use for the remote operations.
    private var baseUrl: String {
        if useLiveEnvironment {
            return TSHIP_API_LIVE_ENV_BASE_URL
        }else{
            return TSHIP_API_DEV_ENV_BASE_URL
        }
    }
    
    /// Instance of AddressRemote class for performing remote operations that involve Addresses.
    var addressesRemote: AddresssesRemote {
        return AddresssesRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of MiscellanousRemote class for performing miscellanous remote operations.
    var miscellanousRemote: MiscellanousRemote {
        return MiscellanousRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of PackagingRemote class for performing remote operations that involve Packaging.
    var packagingRemote: PackagingRemote{
        return PackagingRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of ParcelRemote class for performing remote operations that involve Parcels.
    var parcelRemote: ParcelRemote{
        return ParcelRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of RatesRemote class for performing remote operations that involve Rates.
    var ratesRemote: RatesRemote{
        return RatesRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of ShipmentsRemote class for performing remote operations that involve Shipments.
    var shipmentsRemote: ShipmentsRemote{
        return ShipmentsRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of UsersRemote class for performing remote operations that involve Users.
    var usersRemote: UsersRemote{
        return UsersRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of ShipmentsRemote class for performing remote operations that involve Transactions.
    var transactionsRemote: TransactionsRemote{
        return TransactionsRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Instance of CarriersRemote class for performing remote operations that involve Carriers.
    var carriersRemote: CarriersRemote{
        return CarriersRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    var insuranceRemote: InsuranceRemote{
        return InsuranceRemote(baseUrl: baseUrl, bearerToken: secretKey)
    }
    
    /// Initializes the TShipSDK with secret key which is required for all calls to the TShipAPI.
    /// - Parameters:
    ///  - secretKey: User's TShipAPI Secret key.
    ///  - useLiveEnvironment: Determines whether use the live or test endpoints.
    init(secretKey: String, useLiveEnvironment: Bool = false) {
        self.secretKey = secretKey
        self.useLiveEnvironment = useLiveEnvironment
    }
    
    /// Saves a static instance of the TShipSDK class so it only needs to be intialized once.
    public static var instance: TShipSDK?
    
    /// This function is used to create the static instance of TShipSDK
    @discardableResult
    public static func createInstance(secretKey: String, useLiveEnvironment: Bool = false) -> TShipSDK {
        instance = TShipSDK(secretKey: secretKey, useLiveEnvironment: useLiveEnvironment)
        return instance!
    }
    
}
