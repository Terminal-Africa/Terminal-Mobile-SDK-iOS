/// Contains details about a given page returned in a paginated response.
public struct TShipPageData: Decodable{
    
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = (try? container.decode(Int.self, forKey: .total)) ?? 0
        self.perPage = (try? container.decode(Int.self, forKey: .perPage)) ?? 0
        self.currentPage = (try? container.decode(Int.self, forKey: .currentPage)) ?? 0
        self.pageCount = (try? container.decode(Int.self, forKey: .pageCount)) ?? 0
        self.prevPage = (try? container.decode(Int.self, forKey: .prevPage)) ?? nil
        self.nextPage = (try? container.decode(Int.self, forKey: .nextPage)) ?? nil
        self.hasPrevPage = (try? container.decode(Bool.self, forKey: .hasPrevPage)) ?? false
        self.hasNextPage = (try? container.decode(Bool.self, forKey: .hasNextPage)) ?? false
    }
    
    init(){
        self.total = 0
        self.perPage = 0
        self.currentPage = 0
        self.pageCount = 0
        self.prevPage = nil
        self.nextPage = nil
        self.hasPrevPage = false
        self.hasNextPage = false
    }
    
    enum CodingKeys: String, CodingKey {
        case total
        case perPage
        case currentPage
        case pageCount
        case prevPage
        case nextPage
        case hasPrevPage
        case hasNextPage
    }
    
}
