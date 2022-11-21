/// Used to make a request to cancel a Shipment.
struct CancelShipmentRequest: Encodable{
    
    /// The unique id used to identify the Shipment to cancel.
    let shipmentId: String
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
    }
    
}
