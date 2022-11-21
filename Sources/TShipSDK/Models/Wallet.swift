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
    
    private enum CodingKeys: String, CodingKey{
        
        case companyName = "name"
        
        case createdAt = "created_at"
        
        case userId = "user"
        
        case amount, active, currency
        
    }
    
}
