/// Extensions for Transactions operations on TShipSDK
public extension TShipSDK {
    
    /// This function fetches the user's transactions.
    /// - Parameters:
    ///   - request: Contians the query parameters required to paginated the transactions.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the user's transactions if no error occurred.
    func getTransactions(request: GetTransactionsRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetTransactionsResponse, Error>) -> Void){
        transactionsRemote.getTransactions(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a transaction on the TShip API.
    /// - Parameters:
    ///   - transactionId: Unique id used to identify the transaction.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the transaction if no error occurred.
    func getTransaction(transactionId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Transaction, Error>) -> Void){
        transactionsRemote.getTransaction(transactionId: transactionId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
