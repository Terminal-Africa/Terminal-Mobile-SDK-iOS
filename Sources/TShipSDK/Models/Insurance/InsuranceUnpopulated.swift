//
//  InsuranceUnpopulated.swift
//  
//
//  Created by maxSpane on 16/06/2023.
//

public struct InsuranceUnpopulated: Decodable {
    public let amount: Double
    public let currency: Currency
    public let insuranceId: String
    public var claimId: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.insuranceId = (try? container.decode(String.self, forKey: .insuranceId)) ?? ""
        self.claimId = try? container.decode(String.self, forKey: .claimId)
    }
    
    private enum CodingKeys: String, CodingKey {
        case amount, currency
        case claimId = "claim"
        case insuranceId = "insurance_id"
    }
}

