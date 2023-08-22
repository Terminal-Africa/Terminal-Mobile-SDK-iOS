/// Data model containing details about a Shipment, including the details about the packaging.
public class ShipmentPopulatedWithPackagingData<ParcelMetadata: Codable>: ShipmentPopulated {
    
    /// Contains details about the parcel containing the Packaging details.
    public var parcel: ParcelWithPackagingData<ParcelMetadata>?
    
//    public let parcels: [ParcelWithPackagingData<ParcelMetadata>]?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parcel = try? container.decodeIfPresent(ParcelWithPackagingData.self, forKey: .parcel)
//        parcels = try container.decodeIfPresent([ParcelWithPackagingData].self, forKey: .parcels)
        try super.init(from: decoder)
    }
    
    init(shipmentId: String, pickupDate: String?, shipmentPurpose: ShipmentPurpose, status: ShipmentStatus, events: [ShipmentEvent], extras: ShipmentExtras?, shipmentCost: Double?, shipmentCostCurrency: Currency?, cancellationRequest: Bool?, metadata: ShipmentMetadata?, deliveryAddress: Address, pickupAddress: Address, returnAddress: Address, carrier: Carrier?, rate: Rate?, parcel: ParcelWithPackagingData<ParcelMetadata>?, transactionReference: String?, createdAt: String, type: ShipmentType, insurance: InsuranceUnpopulated?, feedback: Feedback?) {
        super.init(shipmentId: shipmentId, pickupDate: pickupDate, shipmentPurpose: shipmentPurpose, status: status, events: events, extras: extras, shipmentCost: shipmentCost, shipmentCostCurrency: shipmentCostCurrency, cancellationRequest: cancellationRequest, metadata: metadata, deliveryAddress: deliveryAddress, pickupAddress: pickupAddress, returnAddress: returnAddress, carrier: carrier, rate: rate, transactionReference: transactionReference, createdAt: createdAt, type: type, insurance: insurance, feedback: feedback)
        self.parcel = parcel
    }
    
    public func toShipmentPopulatedWithoutPackagingData() -> ShipmentPopulatedWithoutPackagingData<ParcelMetadata>{
        return ShipmentPopulatedWithoutPackagingData<ParcelMetadata>(shipmentId: shipmentId, pickupDate: pickupDate, shipmentPurpose: shipmentPurpose, status: status, events: events, extras: extras, shipmentCost: shipmentCost, shipmentCostCurrency: shipmentCostCurrency, cancellationRequest: cancellationRequest, metadata: metadata, deliveryAddress: deliveryAddress, pickupAddress: pickupAddress, returnAddress: returnAddress, carrier: carrier, rate: rate, parcel: parcel?.toParcelWithoutPackagingData(), transactionReference: transactionReference, createdAt: createdAt, type: type, insurance: insurance, feedback: feedback)
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcel
//        , parcels
    }
    
}
