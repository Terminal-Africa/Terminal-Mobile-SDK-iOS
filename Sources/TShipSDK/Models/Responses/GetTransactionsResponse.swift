/// Represents the response data for paginated transactions, featuring the page data.
public struct GetTransactionsResponse: Decodable {
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated transactions.
    public let transactions: [Transaction]
    
}
