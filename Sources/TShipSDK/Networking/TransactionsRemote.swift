/// Remote class that provides functions to make requests to the transactions route
class TransactionsRemote: NetworkService {
    
    /// This function fetches the user's transactions.
    /// - Parameters:
    ///   - request: Contians the query parameters required to paginated the transactions.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getTransactions(request: GetTransactionsRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetTransactionsResponse, Error>) -> Void){
        self.request(route: Route.transactions(), method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetTransactionsResponse>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This fetches details on a transaction on the TShip API.
    /// - Parameters:
    ///   - transactionId: Unique id used to identify the transaction.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getTransaction(transactionId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Transaction, Error>) -> Void){
        self.request(route: Route.transactions(transactionId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Transaction>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
