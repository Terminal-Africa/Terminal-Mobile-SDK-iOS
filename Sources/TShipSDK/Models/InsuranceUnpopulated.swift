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
    
    private enum CodingKeys: String, CodingKey {
        case amount, currency
        case claimId = "claim"
        case insuranceId = "insurance_id"
    }
}

