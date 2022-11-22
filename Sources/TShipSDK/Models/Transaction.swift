/// Data model containg details about a transaction,
public struct Transaction: Decodable{
    
    /// The amount of money moved on in the transaction.
    public let amount: Double
    
    /// The currency the amount is represented in.
    public let currency: Currency
    
    /// A short description about the transaction.
    public let description: String
    
    /// The type of flow the transaction was.
    public let flow: TransactionFlow
    
    /// A unique string used to identify the transaction on the payment platform used to process it.
    public let referenceId: String
    
    /// Indicates whether the transaction was reversed
    public let reversed: Bool
    
    /// A unique string used to identify the shipment the transaction was used for if it is a payment for a transaction.
    public let shipmentId: String?
    
    /// A unique string used to identify the transaction.
    public let transactionId: String
    
    /// The datetime the transaction was created.
    public let createdAt: String
    
    private enum CodingKeys: String, CodingKey{
        case referenceId = "reference"
        case shipmentId = "shipment_id"
        case transactionId = "transaction_id"
        case createdAt = "created_at"
        case amount, currency, description, flow, reversed
    }
    
}
