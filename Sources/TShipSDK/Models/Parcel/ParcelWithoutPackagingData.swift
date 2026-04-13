///
public class ParcelWithoutPackagingData<T: Codable>: Parcel<T> {
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public let packagingId: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        packagingId = (try? container.decodeIfPresent(String.self, forKey: .packagingId)) ?? ""
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(packagingId, forKey: .packagingId)
        try super.encode(to: encoder) // Encode superclass properties
    }
    
    init(parcelId: String, description: String, weightUnit: String, totalWeight: Double, proofOfPayments: [String]?, proofOfWeights: [String]?, parcelImages: [String]?, metadata: T? = nil, items: [ParcelItem], packagingId: String, packagingDimensions: PackagingDimensions) {
        self.packagingId = packagingId
        super.init(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, proofOfWeights: proofOfWeights, parcelImages: parcelImages, metadata: metadata, items: items, packagingDimensions: packagingDimensions)
    }
    
    public func toParcelWithPackagingData(packaging: Packaging) -> ParcelWithPackagingData<T> {
        return ParcelWithPackagingData(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, proofOfWeights: proofOfWeights, parcelImages: parcelImages, metadata: metadata, items: items, packaging: packaging, packagingDimensions: packagingDimensions)
    }
    
    private enum CodingKeys: String, CodingKey {
        case packagingId = "packaging"
    }
    
}
