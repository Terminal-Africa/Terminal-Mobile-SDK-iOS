/// This class houses the parameters required for paginating carriers.
public class GetTransactionsRequest: PaginatedRequestBuilder {
    
    /// The unique string used to identify the wallet whose transactions to fetch.
    public var walletId: String
    
    /// The type of flow you want to filter the transactions by.
//    public var flow: TransactionFlow?
    
    /// The start date for the date range you want to filter the transactions by.
    public var startDate: String?
    
    /// The end date for the date range you want to filter the transactions by.
    public var endDate: String?
    
    /// Default initializer that optionally takes in the parameters for getting carriers.
    /// - Parameters:
    ///   - walletId:The unique string used to identify the wallet whose transactions to fetch.
    ///   - perPage: The number of items to return in the response per request. The default number is 15.
    ///   - page: The page number of the paginated request. This starts from 1. The default value is 1.
    public init(walletId: String, flow: TransactionFlow? = nil, startDate: String? = "", endDate: String? = nil, perPage: Int = 15, page: Int = 1) {
        self.walletId = walletId
//        self.flow = flow
        self.startDate = startDate
        self.endDate = endDate
        super.init(perPage: perPage, page: page)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(walletId, forKey: .walletId)
//        try container.encode(flow, forKey: .flow)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case walletId = "wallet"
        case startDate = "start_date"
        case endDate = "end_date"
//        case flow
    }
    
}
