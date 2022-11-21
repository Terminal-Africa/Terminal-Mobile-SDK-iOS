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
    
}
