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
    
    /// The cost of shipping.
    public let shipmentCost: Double?
    
    /// The currenct of cost of shipping.
    public let shipmentCostCurrency: Currency?
    
    public let cancellationRequest: Bool?
    
    public let metadata: ShipmentMetadata?
    
    public let transactionReference: String?
    
    public let createdAt: String
    
    public let type: ShipmentType
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shipmentId = try container.decode(String.self, forKey: .shipmentId)
        pickupDate = try container.decodeIfPresent(String.self, forKey: .pickupDate)
        shipmentPurpose = try container.decode(ShipmentPurpose.self, forKey: .shipmentPurpose)
        status = try container.decode(ShipmentStatus.self, forKey: .status)
        events = try container.decode([ShipmentEvent].self, forKey: .events)
        extras = try container.decodeIfPresent(ShipmentExtras.self, forKey: .extras)
        shipmentCost = try container.decodeIfPresent(Double.self, forKey: .shipmentCost)
        shipmentCostCurrency = try container.decodeIfPresent(Currency.self, forKey: .shipmentCostCurrency)
        cancellationRequest = try container.decodeIfPresent(Bool.self, forKey: .cancellationRequest)
        metadata = try container.decodeIfPresent(ShipmentMetadata.self, forKey: .metadata)
        transactionReference = try container.decodeIfPresent(String.self, forKey: .transactionReference)
        createdAt = (try container.decodeIfPresent(String.self, forKey: .createdAt)) ?? ""
        type = (try container.decodeIfPresent(ShipmentType.self, forKey: .type)) ?? .terminal
    }
    
    init(shipmentId: String, pickupDate: String?, shipmentPurpose: ShipmentPurpose, status: ShipmentStatus, events: [ShipmentEvent], extras: ShipmentExtras?, shipmentCost: Double?, shipmentCostCurrency: Currency?, cancellationRequest: Bool?, metadata: ShipmentMetadata?, transactionReference: String?, createdAt: String, type: ShipmentType){
        self.shipmentId = shipmentId
        self.pickupDate = pickupDate
        self.shipmentPurpose = shipmentPurpose
        self.status = status
        self.events = events
        self.extras = extras
        self.shipmentCost = shipmentCost
        self.shipmentCostCurrency = shipmentCostCurrency
        self.cancellationRequest = cancellationRequest
        self.metadata = metadata
        self.transactionReference = transactionReference
        self.createdAt = createdAt
        self.type = type
    }
    
    private enum CodingKeys: String, CodingKey {
        case shipmentId = "shipment_id"
        case pickupDate = "pickup_date"
        case shipmentPurpose = "shipment_purpose"
        case shipmentCost = "shipment_cost"
        case shipmentCostCurrency = "shipment_cost_currency"
        case cancellationRequest = "cancellation_request"
        case transactionReference = "transaction_reference"
        case createdAt = "created_at"
        case status, events, extras, metadata, type
    }
    
}
