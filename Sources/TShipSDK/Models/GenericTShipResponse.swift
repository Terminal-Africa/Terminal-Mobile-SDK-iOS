import Foundation

/// Struct representing the default response structure for response body received from TShip API.
struct GenericTShipResponse<Data: Codable>: Codable {
    
    /// Status that indicates whether the remote operation was successfull.
    let status: Bool
    
    /// Message that describes the result of the API call
    let message: String
    
    /// Data containing the result of the remote operation.
    let data: Data
}
