//
//  GetInsurancePremiumRequest.swift
//  
//
//  Created by maxSpane on 04/01/2023.
//

/// Parameters for calculating an insurance premium.
///
/// Initialize the request with either an existing parcel identifier or a
/// declared parcel value, depending on the premium endpoint being used.
public class GetInsurancePremiumRequest: Encodable{
    public var parcelId: String?
    public var currency: Currency
    public var parcelValue: Double?
    public var insuranceType: InsuranceType
    public var shipmentCurrency: Currency
    
    /// Creates a premium request for an existing parcel.
    public init(parcelId: String, currency: Currency = .NGN, insuranceType: InsuranceType, shipmentCurrency: Currency = .NGN) {
        self.parcelId = parcelId
        self.currency = currency
        self.insuranceType = insuranceType
        self.shipmentCurrency = shipmentCurrency
    }
    
    /// Creates a premium request from a declared parcel value.
    public init(parcelValue: Double, currency: Currency = .NGN, insuranceType: InsuranceType, shipmentCurrency: Currency = .NGN) {
        self.parcelValue = parcelValue
        self.currency = currency
        self.insuranceType = insuranceType
        self.shipmentCurrency = shipmentCurrency
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel"
        case parcelValue = "parcel_value"
        case insuranceType = "insurance_type"
        case shipmentCurrency = "shipment_currency"
        case currency
    }
    
}
