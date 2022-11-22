/// Remote class that provides functions to perform operations on the carriers route.
class CarriersRemote: NetworkService {
    
    /// This function fetches a list of all the carriers available on the TShip API.
    /// - Parameters:
    ///   - request: Contains the query parameters required to paginate the carriers.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getCarriers(request: GetCarriersRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetCarriersResponse, Error>) -> Void){
        self.request(route: Route.carriers(), method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetCarriersResponse>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
