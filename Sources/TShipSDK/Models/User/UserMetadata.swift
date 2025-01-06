/// Data model representing extra data about the user relating to terminal africa.
public struct UserMetadata: Codable {
    
    /// Total amount of shipments performed by the user.
    public let totalShipment: Int?
    
    /// Total amount of money spent on shipment.
    public let totalShipmentAmount: Double?
    
    public let storeId: String
    
    init(totalShipment: Int?, totalShipmentAmount: Double?, storeId: String) {
        self.totalShipment = totalShipment
        self.totalShipmentAmount = totalShipmentAmount
        self.storeId = storeId
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalShipment = try container.decodeIfPresent(Int.self, forKey: .totalShipment)
        self.totalShipmentAmount = try container.decodeIfPresent(Double.self, forKey: .totalShipmentAmount)
        self.storeId = (try? container.decode(String.self, forKey: .storeId)) ?? ""
    }
    
    enum CodingKeys: CodingKey {
        case totalShipment
        case totalShipmentAmount
        case storeId
    }
    
}
