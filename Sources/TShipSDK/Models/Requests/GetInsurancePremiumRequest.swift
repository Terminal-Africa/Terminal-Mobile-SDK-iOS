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
    public var insuranceType: InsuranceType
    
    public init(parcelId: String, currency: Currency = .NGN, insuranceType: InsuranceType = .local) {
        self.parcelId = parcelId
        self.currency = currency
        self.insuranceType = insuranceType
    }
    
    public init(parcelValue: Double, currency: Currency = .NGN, insuranceType: InsuranceType = .local) {
        self.parcelValue = parcelValue
        self.currency = currency
        self.insuranceType = insuranceType
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel"
        case parcelValue = "parcel_value"
        case insuranceType = "insurance_type"
        case currency
    }
    
}
