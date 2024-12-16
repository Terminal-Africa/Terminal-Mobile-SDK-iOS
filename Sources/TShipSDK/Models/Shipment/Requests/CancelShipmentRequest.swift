/// Used to make a request to cancel a Shipment.
public struct CancelShipmentRequest: Encodable{
    
    /// The unique id used to identify the Shipment to cancel.
    let shipmentId: String
    
    /// Reason for cancelling the .
    var cancellationReason: String = ""
    
    public init(shipmentId: String, cancellationReason: String = "") {
        self.shipmentId = shipmentId
        self.cancellationReason = cancellationReason
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case cancellationReason = "cancellation_reason"
    }
    
}
