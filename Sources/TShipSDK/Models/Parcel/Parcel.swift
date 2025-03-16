/// Data model containing information about the parcel to be shipped.
public class Parcel<T: Codable>: Codable {
    
    /// The unique Id used to identify the Parcel .
    public let parcelId: String
    
    /// A short description with details about the Parcel and it's content.
    public let description: String
    
    /// The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.
    public let weightUnit: String
    
    /// The total weight of the Parcel.
    public let totalWeight: Double
    
    /// The currency the value of the items are stored in. The default value for this is Nigerian Naira.
    public var currency: Currency? {
        if items.count == 0 {
            return nil
        }
        return items[0].currency
    }
    
    public var proofOfPayments: [String]?
    
    public var proofOfWeights: [String]?
    
    /// Metadata to be attached to the Parcel.
    public var metadata: T? = nil
    
    /// A list of items in the Parcel.
    public let items: [ParcelItem]
    
    init(parcelId: String, description: String, weightUnit: String, totalWeight: Double, proofOfPayments: [String]?, metadata: T? = nil, items: [ParcelItem]) {
        self.parcelId = parcelId
        self.description = description
        self.weightUnit = weightUnit
        self.totalWeight = totalWeight
        self.proofOfPayments = proofOfPayments
        self.metadata = metadata
        self.items = items
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.parcelId = (try? container.decode(String.self, forKey: .parcelId)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.weightUnit = (try? container.decode(String.self, forKey: .weightUnit)) ?? ""
        self.totalWeight = (try? container.decode(Double.self, forKey: .totalWeight)) ?? 0
        self.proofOfPayments = (try? container.decode([String].self, forKey: .proofOfPayments)) ?? []
        self.proofOfWeights = (try? container.decode([String].self, forKey: .proofOfWeights)) ?? []
        self.metadata = (try? container.decode(T.self, forKey: .metadata)) ?? nil
        self.items = (try? container.decode([ParcelItem].self, forKey: .items)) ?? []
    }
    
    public func getTotalItemValue() -> Double{
        var totalValue: Double = 0
        for item in items {
            totalValue += item.value
        }
        return totalValue
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel_id"
        case weightUnit = "weight_unit"
        case totalWeight = "total_weight"
        case proofOfPayments = "proof_of_payments"
        case proofOfWeights = "rec_docs"
        case description, metadata, items
    }
    
}
