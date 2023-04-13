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
    
    init(shipmentId: String, pickupDate: String?, shipmentPurpose: ShipmentPurpose, status: ShipmentStatus, events: [ShipmentEvent], extras: ShipmentExtras?, shipmentCost: Double?, shipmentCostCurrency: Currency?, cancellationRequest: Bool?, metadata: ShipmentMetadata?, deliveryAddress: Address, pickupAddress: Address, returnAddress: Address, carrier: Carrier?, rate: Rate?) {
        self.deliveryAddress = deliveryAddress
        self.pickupAddress = pickupAddress
        self.returnAddress = returnAddress
        self.carrier = carrier
        self.rate = rate
        super.init(shipmentId: shipmentId, pickupDate: pickupDate, shipmentPurpose: shipmentPurpose, status: status, events: events, extras: extras, shipmentCost: shipmentCost, shipmentCostCurrency: shipmentCostCurrency, cancellationRequest: cancellationRequest, metadata: metadata)
    }
    
    private enum CodingKeys: String, CodingKey {
        case deliveryAddress = "address_to"
        case pickupAddress = "address_from"
        case returnAddress = "address_return"
        case carrier, rate
    }
    
}
