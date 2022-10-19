import Foundation

/// Enum representing the Http Status codes received and handled from  the API.
enum HttpStatusCode: Int {
    
    /// Status code returned when the API operation was successfull.
    case OK = 200
    
    /// Status code returned when the API create operation was successfull.
    case CREATED = 201
    
    /// Status code returned when the request sent to the API is not valid.
    case BAD_REQUEST = 400
}
