/// Remote class that provides functions to make requests to the address route.
class AddresssesRemote: NetworkService {
    
    /// This creates an Address on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - request: Request body with details used to create Address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func createAddress(secretKey: String, request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<Address, Error>) -> Void){
        self.request(route: Route.address(), method: Method.post, bearerToken: secretKey, requestBody: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Address>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This creates an Address on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - addressId: Unique id used to identify the address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getAddress(secretKey: String, addressId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Address, Error>) -> Void){
        self.request(route: Route.address(addressId), method: Method.get, bearerToken: secretKey, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Address>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches Addresses previously created on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - addressId: Unique id used to identify the address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getAddresses(secretKey: String, request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<GetAddressResponseData, Error>) -> Void){
        self.request(route: Route.address(), method: Method.get, bearerToken: secretKey, queryParameters: request,runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetAddressResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This updates an Address previously created on the TShip API.
    /// - Parameters:
    ///   - secretKey: User's TShipAPI Secret key.
    ///   - addressId: Unique id used to identify the address.   
    ///   - request: Request body with the Address details you want to update.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func updateAddress(secretKey: String, addressId: String, request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<Address, Error>) -> Void){
        self.request(route: Route.address(addressId), method: Method.put, bearerToken: secretKey, requestBody: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Address>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
