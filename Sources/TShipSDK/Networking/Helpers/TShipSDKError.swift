import Foundation

/// Enum representing the different types of error that occurs.
enum TShipSDKError: LocalizedError {
    /// Error that occurs when decoding the response from the API.
    case errorDecoding
    /// Error that is not recognised.
    case unknownError
    /// Error returned from TShipAPI, usually when a bad request is sent. It contains the error message returned from the API.
    case serverError(String)
    
    /// Description of the error that occurred.
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "An unknown error occurred. Please try again."
        case .serverError(let error):
            return error
        }
    }
}
