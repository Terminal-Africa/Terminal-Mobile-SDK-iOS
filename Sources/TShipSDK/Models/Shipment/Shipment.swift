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
    
    public let duty: CustomDuty?
    
    public let dutyPaid: Bool?
    
    public let dutyApplied: Bool?
    
    public let regulatoryDocuments: [RegulatoryDocument]
    
    public let regulatoryDocumentsIncluded: Bool?
    
    public let regulatoryDocumentsStatus: String?
    
    public let thubShipmentStatus: String?
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shipmentId = (try? container.decode(String.self, forKey: .shipmentId)) ?? ""
        pickupDate = try? container.decodeIfPresent(String.self, forKey: .pickupDate)
        shipmentPurpose = (try? container.decode(ShipmentPurpose.self, forKey: .shipmentPurpose)) ?? .personal
        status = (try? container.decode(ShipmentStatus.self, forKey: .status)) ?? .pending
        events = (try? container.decode([ShipmentEvent].self, forKey: .events)) ?? []
        extras = try? container.decodeIfPresent(ShipmentExtras.self, forKey: .extras)
        shipmentCost = try? container.decodeIfPresent(Double.self, forKey: .shipmentCost)
        shipmentCostCurrency = try? container.decodeIfPresent(Currency.self, forKey: .shipmentCostCurrency)
        cancellationRequest = try? container.decodeIfPresent(Bool.self, forKey: .cancellationRequest)
        metadata = try? container.decodeIfPresent(ShipmentMetadata.self, forKey: .metadata)
        transactionReference = try? container.decodeIfPresent(String.self, forKey: .transactionReference)
        createdAt = (try? container.decodeIfPresent(String.self, forKey: .createdAt)) ?? ""
        type = (try? container.decodeIfPresent(ShipmentType.self, forKey: .type)) ?? .terminal
        duty = try? container.decodeIfPresent(CustomDuty.self, forKey: .duty)
        dutyPaid = try? container.decodeIfPresent(Bool.self, forKey: .dutyPaid)
        dutyApplied = try? container.decodeIfPresent(Bool.self, forKey: .dutyApplied)
        regulatoryDocuments = (try? container.decodeIfPresent([RegulatoryDocument].self, forKey: .regulatoryDocuments)) ?? []
        regulatoryDocumentsIncluded = try? container.decodeIfPresent(Bool.self, forKey: .regulatoryDocumentsIncluded)
        regulatoryDocumentsStatus = try? container.decodeIfPresent(String.self, forKey: .regulatoryDocumentsStatus)
        thubShipmentStatus = try? container.decodeIfPresent(String.self, forKey: .thubShipmentStatus)
    }
    
    init(shipmentId: String, pickupDate: String?, shipmentPurpose: ShipmentPurpose, status: ShipmentStatus, events: [ShipmentEvent], extras: ShipmentExtras?, shipmentCost: Double?, shipmentCostCurrency: Currency?, cancellationRequest: Bool?, metadata: ShipmentMetadata?, transactionReference: String?, createdAt: String, type: ShipmentType, duty: CustomDuty?, dutyPaid: Bool?, dutyApplied: Bool?, regulatoryDocuments: [RegulatoryDocument], regulatoryDocumentsIncluded: Bool?, regulatoryDocumentsStatus: String?, thubShipmentStatus: String?){
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
        self.duty = duty
        self.dutyPaid = dutyPaid
        self.dutyApplied = dutyApplied
        self.regulatoryDocuments = regulatoryDocuments
        self.regulatoryDocumentsIncluded = regulatoryDocumentsIncluded
        self.regulatoryDocumentsStatus = regulatoryDocumentsStatus
        self.thubShipmentStatus = thubShipmentStatus
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
        case dutyPaid = "duty_paid"
        case dutyApplied = "duty_applied"
        case regulatoryDocuments = "regulatory_documents"
        case regulatoryDocumentsIncluded = "regulatory_documents_included"
        case regulatoryDocumentsStatus = "regulatory_documents_status"
        case thubShipmentStatus = "thub_shipment_status"
        case status, events, extras, metadata, type, duty
    }
    
}
