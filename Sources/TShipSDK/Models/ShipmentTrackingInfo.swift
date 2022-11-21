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
