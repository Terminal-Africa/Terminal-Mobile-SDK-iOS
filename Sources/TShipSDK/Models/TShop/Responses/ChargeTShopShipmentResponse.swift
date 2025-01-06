//
//  ChargeTShopShipmentResponse.swift
//  
//
//  Created by maxSpane on 28/04/2023.
//

public struct ChargeTShopShipmentResponse: Decodable {
    
    /// The amount of money moved on in the transaction.
    public let amount: Double
    
    /// The currency the amount is represented in.
    public let currency: Currency
    
    /// A short description about the transaction.
    public let description: String
    
    /// A unique string used to identify the shipment the transaction was used for if it is a payment for a transaction.
    public let shipmentId: String?
    
    /// A unique string used to identify the transaction.
//    public let transactionId: String
    
    /// The datetime the transaction was created.
    public let createdAt: String
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shipmentId = (try? container.decodeIfPresent(String.self, forKey: .shipmentId)) ?? ""
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey{
        case shipmentId = "shipment_ref"
//        case transactionId = "transaction_id"
        case createdAt = "created_at"
        case amount, currency, description
    }
    
}
