//
//  InsurancePremium.swift
//  
//
//  Created by maxSpane on 04/01/2023.
//

public struct InsurancePremium: Decodable {
    public let premium: Double
    public let currency: Currency
    public let shipmentCurrency: Currency
    public let convertedPremium: Double
    
    enum CodingKeys: String, CodingKey {
        case premium, currency
        case shipmentCurrency = "shipment_currency"
        case convertedPremium = "converted_premium"
    }
}
