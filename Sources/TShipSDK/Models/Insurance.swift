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
    
    private enum CodingKeys: String, CodingKey {
        case amount, currency, claim
        case insuranceId = "insurance_id"
    }
}
