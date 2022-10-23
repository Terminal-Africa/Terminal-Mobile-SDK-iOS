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
    
}
