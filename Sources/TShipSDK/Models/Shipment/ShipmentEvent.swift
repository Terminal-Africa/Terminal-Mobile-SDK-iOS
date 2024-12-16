/// Data model containing information about an event that occurred during the shipping process.
public struct ShipmentEvent: Codable {
    
    /// The datetime the Event occurred.
    public let createdAt: String?
    
    /// A short description of the Event.
    public let description: String?
    
    /// Human readable version of the location the Event happened.
    public let location: String?
    
    /// The status being reported by the Event
    public let status: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try? container.decodeIfPresent(String.self, forKey: .createdAt)
        self.description = try? container.decodeIfPresent(String.self, forKey: .description)
        self.location = try? container.decodeIfPresent(String.self, forKey: .location)
        self.status = (try? container.decode(String.self, forKey: .status)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case description, location, status
    }
    
}
