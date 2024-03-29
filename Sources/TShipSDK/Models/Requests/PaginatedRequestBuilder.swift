/// This class helps create the parameters required for a base paginated request.
public class PaginatedRequestBuilder: Encodable {
    
    /// The number of items to return in the response per request. The default number is 15.
    public var perPage: Int
    
    /// The page number of the paginated request. This starts from 1. The default value is 1.
    public var page: Int
    
    /// Default initializer that optionally takes in the parameters for a paginated request
    /// - Parameters:
    ///   - perPage: The number of items to return in the response per request. The default number is 15.
    ///   - page: The page number of the paginated request. This starts from 1. The default value is 1.
    public init(perPage: Int = 15, page: Int = 1) {
        self.perPage = perPage
        self.page = page
    }
    
    /// This function updates the page number of the request.
    /// - Parameters:
    ///   - page: The page number of the paginated request. This starts from 1
    public func withPage(_ page: Int){
        self.page = page
    }
    
    /// This function updates the number of items to return per paginated request.
    /// - Parameters:
    ///   - perPage: The number of items to return in the response per request.
    public func withPerPage(_ perPage: Int){
        self.perPage = perPage
    }
    
    /// This function returns the built request for a paginated API call.
    /// - Returns: [String:  Any] a dictionary containing the parameters provided to the builder.
    public func build() -> [String: Any]{
        return toDict()
    }
    
}
