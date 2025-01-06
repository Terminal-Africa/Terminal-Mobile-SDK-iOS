//
//  GetTShopRateRequest.swift
//  
//
//  Created by maxSpane on 21/04/2023.
//

public struct GetTShopRateRequest: Encodable {
    
    public var pickupAddress: String
    
    public var deliveryAddress: String
    
    public var parcelId: String
    
    public var currency: Currency
    
    public init(pickupAddress: String, deliveryAddress: String, parcelId: String, currency: Currency) {
        self.pickupAddress = pickupAddress
        self.deliveryAddress = deliveryAddress
        self.parcelId = parcelId
        self.currency = currency
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case pickupAddress = "pickup_address"
        
        case deliveryAddress = "delivery_address"
        
        case parcelId = "parcel_id"
        
        case currency
        
    }
    
}
