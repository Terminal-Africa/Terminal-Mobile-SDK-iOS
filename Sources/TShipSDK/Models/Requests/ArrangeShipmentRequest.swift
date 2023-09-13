/// This class is used to make a request to arrange pickup and delivery for a Shipment.
public class ArrangeShipmentRequest: Encodable {
    
    /// The unique id used to identify the rate to use.
    public var rateId: String
    
    /// The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    public var shipmentId: String?
    
    public var purchaseInsurance: Bool
    
    public var dropOffLocationId: String?
    
    /// Default initializer taking in the details required to arrange a Shipment.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    public init(rateId: String, purchaseInsurance: Bool){
        self.rateId = rateId
        self.purchaseInsurance = purchaseInsurance
    }
    
    /// Initializer taking in the rate id and the shipment id of the Shipment to be arranged.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    ///   - shipmentId: The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    public init(rateId: String, shipmentId: String, purchaseInsurance: Bool){
        self.rateId = rateId
        self.shipmentId = shipmentId
        self.purchaseInsurance = purchaseInsurance
    }
    
    /// This function updates the rate id.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    /// - Returns: The instance of ArrangeShipmentRequest.
    public func withRateId(_ rateId: String) -> ArrangeShipmentRequest{
        self.rateId = rateId
        return self
    }
    
    /// This function updates the shipment id.
    /// - Parameters:
    ///   - shipmentId: The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    /// - Returns: The instance of ArrangeShipmentRequest.
    public func withShipmentId(_ shipmentId: String) -> ArrangeShipmentRequest{
        self.shipmentId = shipmentId
        return self
    }
    
    public func shouldPurchaseInsurance(_ purchaseInsurance: Bool) -> ArrangeShipmentRequest{
        self.purchaseInsurance = purchaseInsurance
        return self
    }
    
    public func withDropOffLocationId(_ dropOffLocationId: String?) -> ArrangeShipmentRequest{
        self.dropOffLocationId = dropOffLocationId
        return self
    }
    
    private enum CodingKeys: String, CodingKey {
        case rateId = "rate_id"
        case shipmentId = "shipment_id"
        case purchaseInsurance = "purchase_insurance"
        case dropOffLocationId = "dropoff_id"
    }
    
}
