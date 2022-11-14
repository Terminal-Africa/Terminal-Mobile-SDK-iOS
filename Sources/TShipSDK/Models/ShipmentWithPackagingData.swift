/// Data model containing details about a Shipment, including the details about the packaging.
public struct ShipmentWithPackagingData<ParcelMetadata: Codable>: Codable {
    
    /// The unique string used to identify the Shipment
    public let shipmentId: String
    
    /// Contains details about the delivery address.
    public let deliveryAddress: Address
    
    /// Contains details about the pickup address.
    public let pickupAddress: Address
    
    /// Contains details about the return address..
    public let returnAddress: Address
    
    /// Contains details about the parcel.
    public let parcel: ParcelWithPackagingData<ParcelMetadata>
    
    /// The datetime the parcel will be picked up.
    public let pickupDate: String?
    
    /// The purpose of the shipment.
    public let shipmentPurpose: ShipmentPurpose
    
    /// The status of the shipment.
    public let status: ShipmentStatus
    
    /// List of Events that have occurred on the shipment.
    public let events: [ShipmentEvent]
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case deliveryAddress = "address_to"
        case pickupAddress = "address_from"
        case returnAddress = "address_return"
        case pickupDate = "pickup_date"
        case shipmentPurpose = "shipment_purpose"
        case status, events, parcel
    }
    
}
