///
public class ParcelWithoutPackagingData<T: Codable>: Parcel<T> {
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public let packagingId: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        packagingId = try container.decode(String.self, forKey: .packagingId)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case packagingId = "packaging"
    }
    
}
