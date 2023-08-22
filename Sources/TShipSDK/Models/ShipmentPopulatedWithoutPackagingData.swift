/// Data model containing information about a Shipment populated with details for addresses, carriers and parcel without the packaging details.
public class ShipmentPopulatedWithoutPackagingData<ParcelMetadata: Codable>: ShipmentPopulated {
    
    //TODO: This should be optional not the values inside the object
    /// Contains details about the parcel excuding the Packaging details but containing the packaging id.
    public let parcel: ParcelWithoutPackagingData<ParcelMetadata>?
    
//    public let parcels: [ParcelWithoutPackagingData<ParcelMetadata>]?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parcel = try? container.decodeIfPresent(ParcelWithoutPackagingData.self, forKey: .parcel)
//        parcels = try container.decodeIfPresent([ParcelWithoutPackagingData].self, forKey: .parcels)
        try super.init(from: decoder)
    }
    
    init(shipmentId: String, pickupDate: String?, shipmentPurpose: ShipmentPurpose, status: ShipmentStatus, events: [ShipmentEvent], extras: ShipmentExtras?, shipmentCost: Double?, shipmentCostCurrency: Currency?, cancellationRequest: Bool?, metadata: ShipmentMetadata?, deliveryAddress: Address, pickupAddress: Address, returnAddress: Address, carrier: Carrier?, rate: Rate?, parcel: ParcelWithoutPackagingData<ParcelMetadata>?, transactionReference: String?, createdAt: String, type: ShipmentType, insurance: InsuranceUnpopulated?, feedback: Feedback?) {
        self.parcel = parcel
        super.init(shipmentId: shipmentId, pickupDate: pickupDate, shipmentPurpose: shipmentPurpose, status: status, events: events, extras: extras, shipmentCost: shipmentCost, shipmentCostCurrency: shipmentCostCurrency, cancellationRequest: cancellationRequest, metadata: metadata, deliveryAddress: deliveryAddress, pickupAddress: pickupAddress, returnAddress: returnAddress, carrier: carrier, rate: rate, transactionReference: transactionReference, createdAt: createdAt, type: type, insurance: insurance, feedback: feedback)
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcel
//        , parcels
    }
    
}
