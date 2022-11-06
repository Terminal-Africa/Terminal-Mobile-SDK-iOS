/// Data model containing information about the parcel to be shipped.
public struct Parcel<T: Codable>: Codable {
    
    /// A short description with details about the Parcel and it's content.
    public var description: String
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public var packagingId: String
    
    /// The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.
    public var weightUnit: String
    
    /// The currency the value of the items are stored in. The default value for this is Nigerian Naira.
    public var currency: String? {
        if items.count == 0 {
            return nil
        }
        return items[0].currency
    }
    
    /// Metadata to be attached to the Parcel.
    var metadata: T? = nil
    
    /// A list of items in the Parcel.
    private(set) public var items: [ParcelItem] = []
    
    private enum CodingKeys: String, CodingKey {
        case packagingId = "packaging"
        case weightUnit = "weight_unit"
        case description, metadata, items
    }
    
}
