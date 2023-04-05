/// Data model containing information about the parcel to be shipped, including the details about the packaging.
public class ParcelWithPackagingData<T: Codable>: Parcel<T> {
    
    /// Details about the Packaging used to keep the Items in the Parcel.
    public let packaging: Packaging
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        packaging = try container.decode(Packaging.self, forKey: .packaging)
        try super.init(from: decoder)
    }
    
    init(parcelId: String, description: String, weightUnit: String, totalWeight: Double, proofOfPayments: [String]?, metadata: T? = nil, items: [ParcelItem], packaging: Packaging) {
        self.packaging = packaging
        super.init(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, metadata: metadata, items: items)
    }
    
    public func toParcelWithoutPackagingData() -> ParcelWithoutPackagingData<T> {
        return ParcelWithoutPackagingData(parcelId: parcelId, description: description, weightUnit: weightUnit, totalWeight: totalWeight, proofOfPayments: proofOfPayments, metadata: metadata, items: items, packagingId: packaging.packagingId)
    }
    
    private enum CodingKeys: String, CodingKey {
        case packaging
    }
    
}
