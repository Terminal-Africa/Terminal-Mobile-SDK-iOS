/// Data model containing information about a Shipment with the Addresses and Carriers populated.
public class ShipmentPopulated: Shipment {
    
    /// Contains details about the delivery address.
    public let deliveryAddress: Address
    
    /// Contains details about the pickup address.
    public let pickupAddress: Address
    
    /// Contains details about the return address.
    public let returnAddress: Address
    
    /// Details about the carrier used to arrange the Shipment.
    public let carrier: Carrier?
    
    public let rate: Rate?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        deliveryAddress = try container.decode(Address.self, forKey: .deliveryAddress)
        pickupAddress = try container.decode(Address.self, forKey: .pickupAddress)
        returnAddress = try container.decode(Address.self, forKey: .returnAddress)
        carrier = try container.decodeIfPresent(Carrier.self, forKey: .carrier)
        rate = try container.decodeIfPresent(Rate.self, forKey: .rate)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case deliveryAddress = "address_to"
        case pickupAddress = "address_from"
        case returnAddress = "address_return"
        case carrier, rate
    }
    
}
