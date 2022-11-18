/// Packaging data model containing information about packaging used to ship items.
public struct Packaging: Decodable {
    
    /// The height of the packaging.
    public let height: Double
    
    /// The width of the packaging.
    public let width: Double
    
    /// The length of the packaging.
    public let length: Double
    
    /// The unit used to measure the size dimensions of the packaging. Only 'cm' is supported at this time.
    public let sizeUnit: String
    
    /// The weight of the packaging.
    public let weight: Double
    
    /// The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.
    public let weightUnit: String
    
    /// The type of the packaging
    public let type: String
    
    /// The unique id used to identify the packaging.
    public let packagingId: String
    
    /// The name users will use to identify the packaging.
    public let name: String
    
    /// The date and time the Packaging was created.
    public let createdAt: String
    
    /// The date and time the Packaging was updated.
    public let updatedAt: String
    
    private enum CodingKeys : String, CodingKey {
        case sizeUnit = "size_unit"
        case weightUnit = "weight_unit"
        case packagingId = "packaging_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case height, width, length, weight, type, name
    }
    
}
