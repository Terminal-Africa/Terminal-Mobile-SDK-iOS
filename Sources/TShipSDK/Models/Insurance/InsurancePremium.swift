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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.premium = (try? container.decode(Double.self, forKey: .premium)) ?? 0
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.shipmentCurrency = (try? container.decode(Currency.self, forKey: .shipmentCurrency)) ?? .NGN
        self.convertedPremium = (try? container.decode(Double.self, forKey: .convertedPremium)) ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case premium, currency
        case shipmentCurrency = "shipment_currency"
        case convertedPremium = "converted_premium"
    }
}
