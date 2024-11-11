//
//  GetShipmentQuoteRequest.swift
//
//
//  Created by maxSpane on 08/11/2023.
//

public struct GetShipmentQuotesRequest: Encodable {
    
    public var pickupAddress: AddressRequest
    
    public var deliveryAddress: AddressRequest
    
    public var parcel: ParcelRequest
    
    public var currency: Currency?
    
    private enum CodingKeys: String, CodingKey {
        case pickupAddress = "pickup_address"
        case deliveryAddress = "delivery_address"
        case parcel, currency
    }
    
}
