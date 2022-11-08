/// This class is used to make a request to get rates for a shipment with provided details.
public class GetRateForShipmentRequest: Codable{
    
    /// The unique id used to identify the previously stored address to pickup the parcel from.
    public var pickupAddressId: String?
    
    /// The unique id used to identify the previously stored address to deliver the parcel to.
    public var deliveryAddressId: String?
    
    /// The unique id used to identify the parcel.
    public var parcelId: String
    
    /// The currency the rates should be returned in.
    public var currency: String
    
    /// The unique id used to identify the shipment.
    public var shipmentId: String?
    
    /// Default initializer taking in the details required to get shipment rates without using a shipment id.
    /// - Parameters:
    ///   - pickupAddressId: The unique id used to identify the previously stored address to pickup the parcel.
    ///   - deliveryAddressId: The unique id used to identify the previously stored address to deliver the parcel to.
    ///   - parcelId: The unique id used to identify the parcel.
    ///   - currency: The currency the rates should be returned in. The default value for this is NGN.
    public init (pickupAddressId: String, deliveryAddressId: String, parcelId: String, currency: Currency = .NGN){
        self.pickupAddressId = pickupAddressId
        self.deliveryAddressId = deliveryAddressId
        self.parcelId = parcelId
        self.currency = currency.rawValue
    }
    
    /// Default initializer taking in the details required to get shipment rates using a shipment id.
    /// - Parameters:
    ///   - shipmentId: The unique id used to identify the shipment whose rates you want to fetch.
    ///   - parcelId: The unique id used to identify the parcel.
    ///   - currency: The currency the rates should be returned in. The default value for this is NGN.
    public init (shipmentId: String, parcelId: String, currency: Currency = .NGN){
        self.shipmentId = shipmentId
        self.parcelId = parcelId
        self.currency = currency.rawValue
    }
    
    private enum CodingKeys: String, CodingKey {
        case pickupAddressId = "pickup_address"
        case deliveryAddressId = "delivery_address"
        case parcelId = "parcel_id"
        case shipmentId = "shipment_id"
        case currency
    }
    
}
