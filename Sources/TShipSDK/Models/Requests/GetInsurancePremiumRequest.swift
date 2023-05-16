//
//  GetInsurancePremiumRequest.swift
//  
//
//  Created by maxSpane on 04/01/2023.
//

public class GetInsurancePremiumRequest: Encodable{
    public var parcelId: String?
    public var currency: Currency
    public var parcelValue: Double?
    
    public init(parcelId: String, currency: Currency = .NGN) {
        self.parcelId = parcelId
        self.currency = currency
    }
    
    public init(parcelValue: Double, currency: Currency = .NGN) {
        self.parcelValue = parcelValue
        self.currency = currency
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel"
        case parcelValue = "parcel_value"
        case currency
    }
    
}
