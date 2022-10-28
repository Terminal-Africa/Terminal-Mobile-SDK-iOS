/// Miscellanous Endpoints that provide data to support operations performed on other Endpoints
class MiscellanousRemote: NetworkService {
    
    /// This function fetches all the cities within a state valid on the TShip API.
    /// - Parameters:
    ///   - request: Request body with country and state code for cities to get.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getValidCities(request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<[City], Error>) -> Void){
        self.request(route: Route.cities, method: Method.get, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[City]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches all the countries valid on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getValidCountries(runCompletionOnUIThread: Bool, completion: @escaping(Result<[Country], Error>) -> Void){
        self.request(route: Route.countries, method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[Country]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches all the states within a country valid on the TShip API.
    /// - Parameters:
    ///   - request: Request body with country code for states to get.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getValidStates(request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<[State], Error>) -> Void){
        self.request(route: Route.states, method: Method.get, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[State]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
