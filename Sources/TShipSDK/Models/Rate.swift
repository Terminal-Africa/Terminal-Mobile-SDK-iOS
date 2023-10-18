/// Rate data model containing details about a rate.
public struct Rate: Decodable {
    
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
    public let currency: String?
    
    /// The unique id used to identify the previously stored address to deliver the parcel to.
    public let deliveryAddressId: String?
    
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
    public let pickupAddressId: String?
    
    /// The unique Id used to identify the parcel that contains the Items to be shipped.
    public let parcelId: String?
    
    public let dropoffAvailable: Bool?
    
    public let breakdown: RateBreakdown?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amount = try container.decodeIfPresent(Double.self, forKey: .amount)
        carrierLogo = try container.decodeIfPresent(String.self, forKey: .carrierLogo)
        carrierName = try container.decodeIfPresent(String.self, forKey: .carrierName)
        carrierRateDescription = try container.decodeIfPresent(String.self, forKey: .carrierRateDescription)
        carrierSlug = try container.decodeIfPresent(String.self, forKey: .carrierSlug)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)
        deliveryAddressId = try container.decodeIfPresent(String.self, forKey: .deliveryAddressId)
        deliveryDate = try container.decodeIfPresent(String.self, forKey: .deliveryDate)
        deliveryEta = try container.decodeIfPresent(Double.self, forKey: .deliveryEta)
        deliveryTime = try container.decodeIfPresent(String.self, forKey: .deliveryTime)
        rateId = try container.decodeIfPresent(String.self, forKey: .rateId)
        pickupDate = try container.decodeIfPresent(String.self, forKey: .pickupDate)
        pickupEta = try container.decodeIfPresent(Double.self, forKey: .pickupEta)
        pickupTime = try container.decodeIfPresent(String.self, forKey: .pickupTime)
        pickupAddressId = try container.decodeIfPresent(String.self, forKey: .pickupAddressId)
        parcelId = try container.decodeIfPresent(String.self, forKey: .parcelId)
        dropoffAvailable = try container.decodeIfPresent(Bool.self, forKey: .dropoffAvailable)
        breakdown = {
            do {
                return try container.decodeIfPresent(RateBreakdown.self, forKey: .breakdown)
            }catch{
                return nil
            }
        }()
    }
    
    private enum CodingKeys: String, CodingKey {
        case carrierLogo = "carrier_logo"
        case carrierName = "carrier_name"
        case carrierRateDescription = "carrier_rate_description"
        case carrierSlug = "carrier_slug"
        case deliveryAddressId = "delivery_address"
        case deliveryDate = "delivery_date"
        case deliveryEta = "delivery_eta"
        case deliveryTime = "delivery_time"
        case rateId = "rate_id"
        case pickupDate = "pickup_date"
        case pickupEta = "pickup_eta"
        case pickupTime = "pickup_time"
        case pickupAddressId = "pickup_address"
        case parcelId = "parcel"
        case dropoffAvailable = "dropoff_available"
        case amount, currency, breakdown
    }
    
}
