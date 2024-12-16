/// Data model all the information needed to track the Shipment.
public struct ShipmentTrackingInfo: Decodable {
    
    /// Contains details about the delivery address.
    public let deliveryAddress: Address
    
    /// Contains details about the pickup address.
    public let pickupAddress: Address
    
    /// Details about the carrier used to arrange the Shipment.
    public let carrier: Carrier?
    
    /// The unique string used to identify the Shipment
    public let shipmentId: String
    
    /// The datetime the parcel will be picked up.
    public let pickupDate: String?
    
    /// The datetime the parcel will be delivered.
    public let deliveryDate: String?
    
    /// The datetime the parcel delivery was arranged.
    public let deliveryArranged: String?
    
    /// The status of the shipment.
    public let status: ShipmentStatus
    
    /// List of Events that have occurred on the shipment.
    public let events: [ShipmentEvent]
    
    /// Details about the last event that happened on the shipment.
    public let trackingStatus: ShipmentEvent?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deliveryAddress = (try? container.decode(Address.self, forKey: .deliveryAddress)) ?? Address(addressId: "", firstName: "", lastName: "", email: "", line1: "", line2: "", phoneNumber: "", altPhoneNumber: "", state: "", zipCode: "", isResidential: true, tShopId: "", coordinates: Coordinates(lat: 0, lng: 0), alias: "", createdAt: "", updatedAt: "", country: "", city: "")
        self.pickupAddress = (try? container.decode(Address.self, forKey: .pickupAddress)) ?? Address(addressId: "", firstName: "", lastName: "", email: "", line1: "", line2: "", phoneNumber: "", altPhoneNumber: "", state: "", zipCode: "", isResidential: true, tShopId: "", coordinates: Coordinates(lat: 0, lng: 0), alias: "", createdAt: "", updatedAt: "", country: "", city: "")
        self.carrier = try? container.decodeIfPresent(Carrier.self, forKey: .carrier)
        self.shipmentId = (try? container.decode(String.self, forKey: .shipmentId)) ?? ""
        self.pickupDate = try? container.decodeIfPresent(String.self, forKey: .pickupDate)
        self.deliveryDate = try? container.decodeIfPresent(String.self, forKey: .deliveryDate)
        self.deliveryArranged = try? container.decodeIfPresent(String.self, forKey: .deliveryArranged)
        self.status = (try? container.decode(ShipmentStatus.self, forKey: .status)) ?? .pending
        self.events = (try? container.decode([ShipmentEvent].self, forKey: .events)) ?? []
        self.trackingStatus = try? container.decodeIfPresent(ShipmentEvent.self, forKey: .trackingStatus)
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case pickupDate = "pickup_date"
        case deliveryDate = "delivery_date"
        case deliveryAddress = "address_to"
        case pickupAddress = "address_from"
        case deliveryArranged = "delivery_arranged"
        case trackingStatus = "tracking_status"
        case carrier, status, events
    }
    
}
