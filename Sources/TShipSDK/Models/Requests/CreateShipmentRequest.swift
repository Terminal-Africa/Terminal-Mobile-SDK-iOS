/// This class is used to make Create requests for Shipments.
public class CreateShipmentRequest: Codable{
    
    /// The unique id used to identify the pickup address.
    public var pickupAddressId: String
    
    /// The unique id used to identify the delivery address.
    public var deliveryAddressId: String
    
    /// The unique id used to identify the return address.
    public var returnAddressId: String
    
    /// The unique id used to identify the parcel.
    public var parcelId: String
    
    /// The purpose for shipping the parcel. This uses the enum ShipmentPurpose.
    public var shipmentPurpose: ShipmentPurpose
    
    /// Default initializer taking in the details required to get shipment rates without using a shipment id.
    /// - Parameters:
    ///   - addressFromId: The unique id used to identify the pickup address.
    ///   - addressToId: The unique id used to identify the delivery address.
    ///   - parcelId: The unique id used to identify the parcel.
    ///   - addressReturnId: The unique id used to identify the return address. If this is not set the addressFromId(the pickup address) is set as the return address.
    ///   - shipmentPurpose: The purpose for shipping the parcel. The default value is personal.
    public init(pickupAddressId: String, deliveryAddressId: String, parcelId: String, returnAddressId: String? = nil, shipmentPurpose: ShipmentPurpose = .personal) {
        self.pickupAddressId = pickupAddressId
        self.deliveryAddressId = deliveryAddressId
        self.parcelId = parcelId
        self.shipmentPurpose = shipmentPurpose
        
        if let returnAddressId = returnAddressId {
            self.returnAddressId = returnAddressId
        } else {
            self.returnAddressId = pickupAddressId
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case pickupAddressId = "address_from"
        
        case deliveryAddressId = "address_to"
        
        case returnAddressId = "address_return"
        
        case parcelId = "parcel"
        
        case shipmentPurpose = "shipment_purpose"
        
    }
    
}
