///
public extension TShipSDK {
    
    /// This function fetches a list of all the carriers available on the TShip API.
    /// - Parameters:
    ///   - request: Contains the query parameters required to paginate the carriers.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the carriers if no error occurred.
    func getCarriers(request: GetCarriersRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetCarriersResponse, Error>) -> Void){
        carriersRemote.getCarriers(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
