/// An enum representing transaction flow types.
public enum TransactionFlow: String, Codable {
    
    /// Represents money going out of the wallet.
    case inflow = "in"
    
    /// Represents money going into the wallet.
    case outflow = "out"
    
}
