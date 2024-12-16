//
//  Insurance.swift
//  
//
//  Created by maxSpane on 17/02/2023.
//

public struct Insurance: Decodable {
    public let amount: Double
    public let currency: Currency
    public let insuranceId: String
    public var claim: Claim?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.insuranceId = (try? container.decode(String.self, forKey: .insuranceId)) ?? ""
        self.claim = try? container.decode( Claim.self, forKey: .claim)
    }
    
    private enum CodingKeys: String, CodingKey {
        case amount, currency, claim
        case insuranceId = "insurance_id"
    }
}
