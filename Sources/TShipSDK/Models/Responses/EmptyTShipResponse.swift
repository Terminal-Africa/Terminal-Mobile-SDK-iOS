/// Data model representing the typical response received from the TShip API ignoring the data field.
public struct EmptyTShipResponse: Decodable {
    
    /// Status that indicates whether the remote operation was successfull.
    let status: Bool
    
    /// Message that describes the result of the API call
    let message: String
    
}
