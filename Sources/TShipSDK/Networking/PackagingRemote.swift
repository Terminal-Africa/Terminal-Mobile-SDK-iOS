/// Remote class that provides functions to make requests to the packaging route.
class PackagingRemote: NetworkService {
    
    /// This creates a Packaging on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Packaging if no error occurred.
    func createPackaging(request: PackagingRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<Packaging, Error>) -> Void){
        
        if let parameterErrorMessage = request.anyRequiredCreateParametersMissing() {
            runInBackgroundOrUIThread(runOnUIThread: runCompletionOnUIThread) {
                completion(.failure(TShipSDKError.serverError(parameterErrorMessage)))
            }
            return
        }
        
        self.request(route: Route.packaging(), method: Method.post, requestBody: request.request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Packaging>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches details of a Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaing.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getPackaging(packagingId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Packaging, Error>) -> Void){
        self.request(route: Route.packaging(packagingId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Packaging>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// This function fetches the list of Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - request: Should contain the query parameters for paginating through the Packaging. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the list of paginated Packaging if no error occurred.
    func getMultiplePackaging(request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<GetMultiplePackagingResponseData, Error>) -> Void){
        self.request(route: Route.packaging(), method: Method.get, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetMultiplePackagingResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// This updates a Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaing
    ///   - request: Request body with details used to create a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the updated Packaging, if no error occurred.
    func updatePackaging(packagingId: String, request: PackagingRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<Packaging, Error>) -> Void){
        self.request(route: Route.packaging(packagingId), method: Method.put, requestBody: request.request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Packaging>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
