/// Used to make a request to get a user's wallet details.
struct GetUserWalletRequest: Encodable {
    
    /// Unique string used to identify a user on the TShip API.
    let userId: String
    
    private enum CodingKeys: String, CodingKey{
        case userId = "user_id"
    }
    
}
