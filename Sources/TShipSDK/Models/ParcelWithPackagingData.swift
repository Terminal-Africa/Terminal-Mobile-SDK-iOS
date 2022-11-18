/// Data model containing information about the parcel to be shipped, including the details about the packaging.
public class ParcelWithPackagingData<T: Codable>: Parcel<T> {
    
    /// Details about the Packaging used to keep the Items in the Parcel.
    public let packaging: Packaging
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        packaging = try container.decode(Packaging.self, forKey: .packaging)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case packaging
    }
    
}
