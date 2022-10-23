/// Miscellanous Endpoints that provide data to support operations performed on other Endpoints
class MiscellanousRemote: NetworkService {
    
    /// This function fetches all the countries valid on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getValidCountries(secretKey: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<[Country], Error>) -> Void){
        self.request(route: Route.countries, method: Method.get, bearerToken: secretKey, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[Country]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
