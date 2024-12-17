/// Represents the response data for paginated transactions, featuring the page data.
public struct GetTransactionsResponse: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated transactions.
    public let transactions: [Transaction]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.transactions = (try? container.decode([Transaction].self, forKey: .transactions)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination, transactions
    }
}
