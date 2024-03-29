//
//  SelectedRate.swift
//  
//
//  Created by maxSpane on 29/03/2023.
//

public struct SelectedRate: Decodable {
    
    /// The cost of shipping with this Rate.
    public let amount: Double?
    
    /// A Url to the carrier's logo.
    public let carrierLogo: String?
    
    /// The carrier's name.
    public let carrierName: String?
    
    /// A short description from the carrier about the Rate
    public let carrierRateDescription: String?
    
    /// The unique string used to identify the carrier.
    public let carrierSlug: String?
    
    /// The currency the rate's amount is in.
    public let currency: Currency?
    
    /// The unique id used to identify the previously stored address to deliver the parcel to.
    public let deliveryAddress: Address?
    
    /// The datetime the delivery is expected to have been made.
    public let deliveryDate: String?
    
    /// The estimated amount of time it would take to deliver the parcel in minutes.
    public let deliveryEta: Double?
    
    /// The estimated amount of time it would take to deliver the parcel in human readable text.
    public let deliveryTime: String?
    
    /// The unique Id used to identify the rate.
    public let rateId: String?
    
    /// The datetime the delivery is expected to have been picked up.
    public let pickupDate: String?
    
    /// The estimated amount of time it would take to pick up the parcel in minutes.
    public let pickupEta: Double?
    
    /// The estimated amount of time it would take to pick up the parcel in human readable text.
    public let pickupTime: String?
    
    /// The unique id used to identify the previously stored address to pick up the parcel from.
    public let pickupAddress: Address?
    
    /// The unique Id used to identify the parcel that contains the Items to be shipped.
    public let parcel: ParcelWithPackagingData<EmptyMetadata>?
    
    private enum CodingKeys: String, CodingKey {
        case carrierLogo = "carrier_logo"
        case carrierName = "carrier_name"
        case carrierRateDescription = "carrier_rate_description"
        case carrierSlug = "carrier_slug"
        case deliveryAddress = "delivery_address"
        case deliveryDate = "delivery_date"
        case deliveryEta = "delivery_eta"
        case deliveryTime = "delivery_time"
        case rateId = "rate_id"
        case pickupDate = "pickup_date"
        case pickupEta = "pickup_eta"
        case pickupTime = "pickup_time"
        case pickupAddress = "pickup_address"
        case amount, currency, parcel
    }
    
}
