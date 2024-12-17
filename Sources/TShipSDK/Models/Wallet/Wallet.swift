/// Data model containing information about a user's wallet.
public struct Wallet: Decodable {
    
    /// The name of the user's company.
    public let companyName: String
    
    /// The amount of money in the user's wallet.
    public let amount: Double
    
    /// The currency the user's wallet is being returned in.
    public let currency: Currency
    
    /// The unique string used to identify the user on the TShip API.
    public let userId: String
    
    /// Indicates whether the user's wallet is active or not.
    public let active: Bool
    
    /// The datetime the user's wallet was created.
    public let createdAt: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = (try? container.decode(String.self, forKey: .companyName)) ?? ""
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.userId = (try? container.decode(String.self, forKey: .userId)) ?? ""
        self.active = (try? container.decode(Bool.self, forKey: .active)) ?? true
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey{
        
        case companyName = "name"
        
        case createdAt = "created_at"
        
        case userId = "user"
        
        case amount, active, currency
        
    }
    
}
