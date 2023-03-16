/// Data model containing information about the parcel to be shipped.
public class Parcel<T: Codable>: Decodable {
    
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
    
    public var proofOfPayments: [String] = []
    
    /// Metadata to be attached to the Parcel.
    public var metadata: T? = nil
    
    /// A list of items in the Parcel.
    public let items: [ParcelItem]
    
    private enum CodingKeys: String, CodingKey {
        case parcelId = "parcel_id"
        case weightUnit = "weight_unit"
        case totalWeight = "total_weight"
        case description, metadata, items
    }
    
}
