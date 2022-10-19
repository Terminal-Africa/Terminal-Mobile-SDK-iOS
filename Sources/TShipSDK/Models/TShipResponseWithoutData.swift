import Foundation

/// Struct representing the default response structure for response received from TShip API with the data field being ignored. This was created to extract error mesages because the error response body's data type is not consistent.
struct TShipResponseWithoutData: Codable {
    /// Status that indicates whether the remote operation was successfull.
    let status: Bool
    /// Message that describes the result of the API call
    let message: String
}
