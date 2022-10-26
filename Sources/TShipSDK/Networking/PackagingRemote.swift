/// Remote class that provides functions to make requests to the packaging route.
class PackagingRemote: NetworkService {
    
    /// This creates a Packaging on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - request: Request body with details used to create a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Packaging if no error occurred.
    func createPackaging(secretKey: String, request: PackagingRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<Packaging, Error>) -> Void){
        
        if let parameterErrorMessage = request.anyRequiredCreateParametersMissing() {
            runInBackgroundOrUIThread(runOnUIThread: runCompletionOnUIThread) {
                completion(.failure(TShipSDKError.serverError(parameterErrorMessage)))
            }
            return
        }
        
        self.request(route: Route.packaging(), method: Method.post, bearerToken: secretKey, requestBody: request.request, runCompletionOnUIThread: runCompletionOnUIThread) {
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
