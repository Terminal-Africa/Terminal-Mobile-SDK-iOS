/// Remote class that provides functions to make requests to the users route.
class UsersRemote: NetworkService {
    
    /// This function fetches details of a User's profile.
    /// - Parameters:
    ///   - userId: The unique string used to identify the user on the TShip API.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getUserProfile(userId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<User, Error>) -> Void){
        self.request(route: Route.users(userId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<User>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches details about a user's wallet.
    /// - Parameters:
    ///   - userId: The unique string used to identify the user on the TShip API.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getUserWallet(request: GetUserWalletRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<Wallet, Error>) -> Void){
        self.request(route: Route.userWallet, method: Method.get, queryParameters: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Wallet>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches list of all carriers available for a user.
    /// - Parameters:
    ///   - request: Contains the query parameters required to paginate the carriers.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getUserCarriers(request: GetCarriersRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetCarriersResponse, Error>) -> Void){
        self.request(route: Route.userCarriers, method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
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
