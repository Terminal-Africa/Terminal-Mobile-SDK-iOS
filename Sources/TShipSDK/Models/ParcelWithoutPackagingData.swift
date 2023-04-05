///
public class ParcelWithoutPackagingData<T: Codable>: Parcel<T> {
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public let packagingId: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        packagingId = (try container.decodeIfPresent(String.self, forKey: .packagingId)) ?? ""
        try super.init(from: decoder)
    }
    
    init(parcelId: String, description: String, weightUnit: String, totalWeight: Double, proofOfPayments: [String]?, metadata: T? = nil, items: [ParcelItem], packagingId: String) {
        self.packagingId = packagingId
        super.init(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, metadata: metadata, items: items)
    }
    
    public func toParcelWithPackagingData(packaging: Packaging) -> ParcelWithPackagingData<T> {
        return ParcelWithPackagingData(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, metadata: metadata, items: items, packaging: packaging)
    }
    
    private enum CodingKeys: String, CodingKey {
        case packagingId = "packaging"
    }
    
}
