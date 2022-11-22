/// Base Shipment model containing information about a Shipment.
public class Shipment: Decodable{
    
    /// The unique string used to identify the Shipment
    public let shipmentId: String
    
    /// The datetime the parcel will be picked up.
    public let pickupDate: String?
    
    /// The purpose of the shipment.
    public let shipmentPurpose: ShipmentPurpose
    
    /// The status of the shipment.
    public let status: ShipmentStatus
    
    /// List of Events that have occurred on the shipment.
    public let events: [ShipmentEvent]
    
    /// Details about the carrier used to arrange the Shipment.
    public let extras: ShipmentExtras?
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shipmentId = try container.decode(String.self, forKey: .shipmentId)
        pickupDate = try container.decodeIfPresent(String.self, forKey: .pickupDate)
        shipmentPurpose = try container.decode(ShipmentPurpose.self, forKey: .shipmentPurpose)
        status = try container.decode(ShipmentStatus.self, forKey: .status)
        events = try container.decode([ShipmentEvent].self, forKey: .events)
        extras = try container.decodeIfPresent(ShipmentExtras.self, forKey: .extras)
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case pickupDate = "pickup_date"
        case shipmentPurpose = "shipment_purpose"
        case status, events, extras
    }
    
}
