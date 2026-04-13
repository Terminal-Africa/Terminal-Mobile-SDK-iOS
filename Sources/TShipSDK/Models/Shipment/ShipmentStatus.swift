/// An enum representing the various shipment status
public enum ShipmentStatus: String, Codable, CaseIterable {
    
    /// Represents when the shipment has not been arranged.
    case draft
    
    /// Represents when a shipment is yet to be confirmed by the carrier.
    case pending
    
    /// Represents when a shipment is being processed.
    case processing
    
    /// Represents when a shipment is pending payment.
    case pendingPayment = "pending-payment"
    
    /// Represents when a shipment is paid.
    case paid
    
    /// Represents when the shipment has been confirmed by the carrier.
    case confirmed
    
    /// Represents when the parcel is on it's way to it's destination.
    case inTransit = "in-transit"
    
    /// Represents when the shipment has been delivered to the delivery address.
    case delivered
    
    /// Represents when the shipment has been cancelled.
    case cancelled
    
    public var title: String{
        get {
            self.rawValue.capitalized
        }
    }
    
}
