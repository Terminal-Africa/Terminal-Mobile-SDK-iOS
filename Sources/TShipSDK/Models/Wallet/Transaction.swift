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
    public let referenceId: String?
    
    /// Indicates whether the transaction was reversed
    public let reversed: Bool
    
    /// A unique string used to identify the shipment the transaction was used for if it is a payment for a transaction.
    public let shipmentId: String?
    
    /// A unique string used to identify the transaction.
    public let transactionId: String?
    
    /// The datetime the transaction was created.
    public let createdAt: String
    
    /// The status of the transaction
    public let status: TransactionStatus
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.flow = (try? container.decode(TransactionFlow.self, forKey: .flow)) ?? .inflow
        self.referenceId = try? container.decodeIfPresent(String.self, forKey: .referenceId)
        self.reversed = (try? container.decode(Bool.self, forKey: .reversed)) ?? false
        self.shipmentId = try? container.decodeIfPresent(String.self, forKey: .shipmentId)
        self.transactionId = try? container.decodeIfPresent(String.self, forKey: .transactionId)
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
        self.status = (try? container.decode(TransactionStatus.self, forKey: .status)) ?? .pending
    }
    
    private enum CodingKeys: String, CodingKey{
        case referenceId = "reference"
        case shipmentId = "shipment_id"
        case transactionId = "transaction_id"
        case createdAt = "created_at"
        case amount, currency, description, flow, reversed, status
    }
    
}
