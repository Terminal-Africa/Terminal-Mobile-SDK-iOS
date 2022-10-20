/// Contains details about a given page returned in a paginated response.
public struct TShipPageData: Codable{
    
    /// The total number items that can be returned from the Endpoint.
    public let total: Int
    
    /// The number of items set to be returned per paginated request.
    public let perPage: Int
    
    /// The page number of data being returned.
    public let currentPage: Int
    
    /// The number of pages of data that can be returned.
    public let pageCount: Int
    
    /// The page number of the previous page. If there is no previous page this value is null.
    public let prevPage: Int?
    
    /// The page number of the next page. If there is no next page this value is null.
    public let nextPage: Int?
    
    /// Indicates whether there is a previous page.
    public let hasPrevPage: Bool
    
    /// Indicates whether there is a next page.
    public let hasNextPage: Bool
    
}
