/// This class is used to make a request to arrange pickup and delivery for a Shipment.
public class ArrangeShipmentRequest: Encodable {
    
    /// The unique id used to identify the rate to use.
    public var rateId: String
    
    /// The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    public var shipmentId: String?
    
    /// Default initializer taking in the details required to arrange a Shipment.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    public init(rateId: String){
        self.rateId = rateId
    }
    
    /// Initializer taking in the rate id and the shipment id of the Shipment to be arranged.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    ///   - shipmentId: The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    public init(rateId: String, shipmentId: String){
        self.rateId = rateId
        self.shipmentId = shipmentId
    }
    
    /// This function updates the rate id.
    /// - Parameters:
    ///   - rateId: The unique id used to identify the rate to use.
    /// - Returns: The instance of ArrangeShipmentRequest.
    func withRateId(_ rateId: String) -> ArrangeShipmentRequest{
        self.rateId = rateId
        return self
    }
    
    /// This function updates the shipment id.
    /// - Parameters:
    ///   - shipmentId: The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.
    /// - Returns: The instance of ArrangeShipmentRequest.
    func withShipmentId(_ shipmentId: String) -> ArrangeShipmentRequest{
        self.shipmentId = shipmentId
        return self
    }
    
    private enum CodingKeys: String, CodingKey {
        case rateId = "rate_id"
        case shipmentId = "shipment_id"
    }
    
}
