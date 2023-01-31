//
//  GetInsurancePremiumRequest.swift
//  
//
//  Created by maxSpane on 04/01/2023.
//

public class GetInsurancePremiumRequest: Encodable{
    public var parcelId: String
    public var currency: Currency
    
    public init(parcelId: String, currency: Currency = .NGN) {
        self.parcelId = parcelId
        self.currency = currency
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel"
        case currency
    }
    
}
