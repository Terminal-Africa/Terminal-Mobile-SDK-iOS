/// Data model representing extra data about the user relating to terminal africa.
public struct UserMetadata: Codable {
    
    /// Total amount of shipments performed by the user.
    public let totalShipment: Int?
    
    /// Total amount of money spent on shipment.
    public let totalShipmentAmount: Double?
    
    public let storeId: String
    
}
