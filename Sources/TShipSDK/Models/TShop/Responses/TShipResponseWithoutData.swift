import Foundation

/// Struct representing the default response structure for response received from TShip API with the data field being ignored. This was created to extract error mesages because the error response body's data type is not consistent.
struct TShipResponseWithoutData: Codable {
    /// Status that indicates whether the remote operation was successfull.
    let status: Bool
    /// Message that describes the result of the API call
    let message: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = (try? container.decode(Bool.self, forKey: .status)) ?? false
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
    }
    
    enum CodingKeys: CodingKey {
        case status
        case message
    }
    
}
