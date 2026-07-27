/// An enum representing transaction flow types.
public enum TransactionFlow: String, Codable {
    
    /// Represents money entering the wallet.
    case inflow = "in"
    
    /// Represents money leaving the wallet.
    case outflow = "out"
    
}
