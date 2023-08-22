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
    
    /// This function fetches details of a carrier available on the TShip API.
    /// - Parameters:
    ///   - carrierId: The unique string used to identify a carrier.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getCarrier(carrierId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Carrier, Error>) -> Void){
        self.request(route: Route.carriers(carrierId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Carrier>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function disables a carrier for a user on the TShip API.
    /// - Parameters:
    ///   - carrierId: The unique string used to identify a carrier.
    ///   - request: Contains the parameters required to disable a request.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func disableCarrier(carrierId: String, request: DisableCarrierRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<String, Error>) -> Void){
        self.reRequest(route: Route.disableCarrier(carrierId), method: Method.post, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<EmptyTShipResponse, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.message))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function enable a carrier for a user on the TShip API.
    /// - Parameters:
    ///   - carrierId: The unique string used to identify a carrier.
    ///   - request: Contains the parameters required to enable a request.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func enableCarrier(carrierId: String, request: EnableCarrierRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<Carrier, Error>) -> Void){
        self.reRequest(route: Route.enableCarrier(carrierId), method: Method.post, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Carrier>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getDropOffLocations(request: GetDropOffLocationsRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<[DropOffLocation], Error>) -> Void){
        self.reRequest(route: Route.getDropOffLocations, method: Method.get, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[DropOffLocation]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
