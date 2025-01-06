//
//  GetTShopQuoteRequest.swift
//
//
//  Created by maxSpane on 10/10/2023.
//

public struct GetTShopQuickQuoteRequest: Encodable {
    
    public let pickupAddress: String
    
    public let deliveryAddress: AddressRequest
    
    public let parcel: ParcelRequest
    
    public init(pickupAddress: String, deliveryAddress: AddressRequest, parcel: ParcelRequest) {
        self.pickupAddress = pickupAddress
        self.deliveryAddress = deliveryAddress
        self.parcel = parcel
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case pickupAddress = "pickup_address"
        
        case deliveryAddress = "delivery_address"
        
        case parcel
        
    }
    
}
