/// Timezone data model containing timezone information for a region.
public struct Timezone: Codable {
    
    /// The technical name of the timezone.
    public let zoneName: String
    
    /// The timezone's gmt offset
    public let gmtOffset: Int
    
    /// The timezone's gmt offset
    public let gmtOffsetName: String
    
    /// The timezone's abbreviation
    public let abbreviation: String
    
    /// The less technical name of the timezone
    public let tzName: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.zoneName = (try? container.decode(String.self, forKey: .zoneName)) ?? ""
        self.gmtOffset = (try? container.decode(Int.self, forKey: .gmtOffset)) ?? 0
        self.gmtOffsetName = (try? container.decode(String.self, forKey: .gmtOffsetName)) ?? ""
        self.abbreviation = (try? container.decode(String.self, forKey: .abbreviation)) ?? ""
        self.tzName = (try? container.decode(String.self, forKey: .tzName)) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case zoneName
        case gmtOffset
        case gmtOffsetName
        case abbreviation
        case tzName
    }
}
