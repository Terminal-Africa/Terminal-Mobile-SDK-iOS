
let TSHIP_API_LIVE_ENV_BASE_URL = "https://api.terminal.africa/v1"
let TSHIP_API_DEV_ENV_BASE_URL = "https://sandbox.terminal.africa/v1"

let TSHIP_API_LIVE_ENV_BASE_URL_V2 = "https://api.terminal.africa/v2"
let TSHIP_API_DEV_ENV_BASE_URL_V2 = "https://sandbox.terminal.africa/v2"

/// A client for accessing the Terminal shipping API.
///
/// Create a client with ``init(secretKey:appIdentifier:useLiveEnvironment:)``,
/// or use ``createInstance(secretKey:appIdentifier:useLiveEnvironment:)`` when
/// the app needs a shared instance.
public class TShipSDK {
    
    /// User's TShipAPI Secret key
    private let secretKey: String
    
    /// Identifier for the app using the TShipSDK
    private let appIdentifier: String
    
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
    
    /// The Base Url to use for the remote operations.
    private var baseUrlV2: String {
        if useLiveEnvironment {
            return TSHIP_API_LIVE_ENV_BASE_URL_V2
        }else{
            return TSHIP_API_DEV_ENV_BASE_URL_V2
        }
    }
    
    /// Instance of AddressRemote class for performing remote operations that involve Addresses.
    var addressesRemote: AddresssesRemote {
        return AddresssesRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of MiscellanousRemote class for performing miscellanous remote operations.
    var miscellanousRemote: MiscellanousRemote {
        return MiscellanousRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of PackagingRemote class for performing remote operations that involve Packaging.
    var packagingRemote: PackagingRemote{
        return PackagingRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of ParcelRemote class for performing remote operations that involve Parcels.
    var parcelRemote: ParcelRemote{
        return ParcelRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of RatesRemote class for performing remote operations that involve Rates.
    var ratesRemote: RatesRemote{
        return RatesRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of ShipmentsRemote class for performing remote operations that involve Shipments.
    var shipmentsRemote: ShipmentsRemote{
        return ShipmentsRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of ShipmentsRemote class for performing remote operations that involve Shipments on v2.
    var shipmentsV2Remote: ShipmentsV2Remote{
        return ShipmentsV2Remote(baseUrl: baseUrlV2, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of UsersRemote class for performing remote operations that involve Users.
    var usersRemote: UsersRemote{
        return UsersRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of ShipmentsRemote class for performing remote operations that involve Transactions.
    var transactionsRemote: TransactionsRemote{
        return TransactionsRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Instance of CarriersRemote class for performing remote operations that involve Carriers.
    var carriersRemote: CarriersRemote{
        return CarriersRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var insuranceRemote: InsuranceRemote{
        return InsuranceRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var claimsRemote: ClaimsRemote{
        return ClaimsRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var tShopRemote: TShopRemote{
        return TShopRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var hsCodeRemote: HSCodeRemote{
        return HSCodeRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var simplifiedHSCodeRemote: SimplifiedHSCodeRemote{
        return SimplifiedHSCodeRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    var dutiesRemote: DutiesRemote{
        return DutiesRemote(baseUrl: baseUrl, bearerToken: secretKey, appIdentifier: appIdentifier)
    }
    
    /// Creates a Terminal shipping API client.
    /// - Parameters:
    ///   - secretKey: The secret API key used to authorize requests.
    ///   - appIdentifier: The identifier sent with requests to identify the integrating app.
    ///   - useLiveEnvironment: `true` to use production; `false` to use the sandbox. Defaults to `false`.
    public init(secretKey: String, appIdentifier: String, useLiveEnvironment: Bool = false) {
        self.secretKey = secretKey
        self.useLiveEnvironment = useLiveEnvironment
        self.appIdentifier = appIdentifier
    }
    
    /// The shared client created by ``createInstance(secretKey:appIdentifier:useLiveEnvironment:)``.
    ///
    /// This value is `nil` until `createInstance` is called.
    public static var instance: TShipSDK?
    
    /// Creates and stores the shared Terminal shipping API client.
    /// - Parameters:
    ///   - secretKey: The secret API key used to authorize requests.
    ///   - appIdentifier: The identifier sent with requests to identify the integrating app.
    ///   - useLiveEnvironment: `true` to use production; `false` to use the sandbox. Defaults to `false`.
    /// - Returns: The newly created client, also available from ``instance``.
    @discardableResult
    public static func createInstance(secretKey: String, appIdentifier: String, useLiveEnvironment: Bool = false) -> TShipSDK {
        instance = TShipSDK(secretKey: secretKey, appIdentifier: appIdentifier, useLiveEnvironment: useLiveEnvironment)
        return instance!
    }
    
}
