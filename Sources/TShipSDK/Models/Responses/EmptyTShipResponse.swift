/// Data model representing the typical response received from the TShip API ignoring the data field.
public struct EmptyTShipResponse: Decodable {
    
    /// Status that indicates whether the remote operation was successfull.
    let status: Bool
    
    /// Message that describes the result of the API call
    let message: String
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = (try? container.decode(Bool.self, forKey: .status)) ?? false
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
    }
    
    enum CodingKeys: CodingKey {
        case status
        case message
    }
    
}
