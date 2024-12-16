/// Packaging data model containing information about packaging used to ship items.
public struct Packaging: Codable {
    
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
    public let type: PackagingType
    
    /// The unique id used to identify the packaging.
    public let packagingId: String
    
    /// The name users will use to identify the packaging.
    public let name: String
    
    /// The date and time the Packaging was created.
    public let createdAt: String
    
    /// The date and time the Packaging was updated.
    public let updatedAt: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = (try? container.decode(Double.self, forKey: .height)) ?? 0
        self.width = (try? container.decode(Double.self, forKey: .width)) ?? 0
        self.length = (try? container.decode(Double.self, forKey: .length)) ?? 0
        self.sizeUnit = (try? container.decode(String.self, forKey: .sizeUnit)) ?? ""
        self.weightUnit = (try? container.decode(String.self, forKey: .weightUnit)) ?? ""
        self.weight = (try? container.decode(Double.self, forKey: .weight)) ?? 0
        self.type = (try? container.decode(PackagingType.self, forKey: .type)) ?? .box
        self.packagingId = (try? container.decode(String.self, forKey: .packagingId)) ?? ""
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
        self.updatedAt = (try? container.decode(String.self, forKey: .updatedAt)) ?? ""
    }
    
    private enum CodingKeys : String, CodingKey {
        case sizeUnit = "size_unit"
        case weightUnit = "weight_unit"
        case packagingId = "packaging_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case height, width, length, weight, type, name
    }
    
}
