/// Data model containing information about a Shipment.
public class ShipmentUnpopulated: Shipment {
    
    /// The unique id used to identify the previously stored address to deliver the parcel to.
    public let deliveryAddressId: String
    
    /// The unique id used to identify the previously stored address to pick up the parcel from.
    public let pickupAddressId: String
    
    /// The unique id used to identify the previously stored address to return the parcel to.
    public let returnAddressId: String
    
    /// The unique Id used to identify the parcel that contains the Items to be shipped.
    public let parcelId: String
    
    /// The unique id used to idetify the carrier used to arrange the Shipment.
    public let carrierId: String?
    
    /// The unique id used to idetify the rate used to arrange the Shipment.
    public let rateId: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        deliveryAddressId = try container.decode(String.self, forKey: .deliveryAddressId)
        returnAddressId = try container.decode(String.self, forKey: .returnAddressId)
        pickupAddressId = try container.decode(String.self, forKey: .pickupAddressId)
        parcelId = try container.decode(String.self, forKey: .parcelId)
        carrierId = try container.decodeIfPresent(String.self, forKey: .carrierId)
        rateId = try container.decodeIfPresent(String.self, forKey: .rateId)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case deliveryAddressId = "address_to"
        case pickupAddressId = "address_from"
        case returnAddressId = "address_return"
        case parcelId = "parcel"
        case carrierId = "carrier"
        case rateId = "rate"
    }
    
}
