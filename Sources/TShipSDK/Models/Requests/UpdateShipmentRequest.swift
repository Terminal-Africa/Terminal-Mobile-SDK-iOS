/// Contains the parameters to update a shipment with.
public class UpdateShipmentRequest: Encodable {
    
    /// The unique string used to identify the new pickup address to use for the shipment.
    public var pickupAddressId: String?
    
    /// The unique string used to identify the new delivery address to use for the shipment.
    public var deliveryAddressId: String?
    
    /// The unique string used to identify the new return address to use for the shipment.
    public var returnAddressId: String?
    
    /// The unique string used to identify the new shipment purpose to use for the shipment.
    public var shipmentPurpose: ShipmentPurpose?
    
    public var parcels: [String]?
    
    public var parcel: String?
    
    public init() {}
    
    /// This function sets the pickup address id to update the shipment to.
    /// - Parameter pickupAddressId: The unique string used to identify the new pickup address to use for the shipment.
    /// - Returns: This instance of UpdateShipmentRequest.
    public func withPickupAddressId(_ pickupAddressId: String) -> UpdateShipmentRequest{
        self.pickupAddressId = pickupAddressId
        return self
    }
    
    /// This function sets the delivery address id to update the shipment to.
    /// - Parameter deliveryAddressId: The unique string used to identify the new delivery address to use for the shipment.
    /// - Returns: This instance of UpdateShipmentRequest.
    public func withDeliveryAddressId(_ deliveryAddressId: String) -> UpdateShipmentRequest {
        self.deliveryAddressId = deliveryAddressId
        return self
    }
    
    /// This function sets the return address id to update the shipment to.
    /// - Parameter returnAddressId: The unique string used to identify the new return address to use for the shipment.
    /// - Returns: This instance of UpdateShipmentRequest.
    public func withReturnAddressId(_ returnAddressId: String) -> UpdateShipmentRequest {
        self.returnAddressId = returnAddressId
        return self
    }
    
    /// This function sets the shipment purpose to update the shipment to.
    /// - Parameter shipmentPurpose: The new shipment purpose to use for the shipment.
    /// - Returns: This instance of UpdateShipmentRequest.
    public func withShipmentPurpose(_ shipmentPurpose: ShipmentPurpose) -> UpdateShipmentRequest {
        self.shipmentPurpose = shipmentPurpose
        return self
    }
    
    public func withParcels(_ parcels: [String]) -> UpdateShipmentRequest {
        self.parcels = parcels
        return self
    }
    
    private enum CodingKeys: String, CodingKey {
        case pickupAddressId = "address_from"
        case deliveryAddressId = "address_to"
        case returnAddressId = "address_return"
        case shipmentPurpose = "shipment_purpose"
        case parcels, parcel
    }
    
}
