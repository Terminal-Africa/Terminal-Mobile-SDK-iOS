/// Remote class that provides functions to make requests to the parcels route.
class ParcelRemote: NetworkService {
    
    /// This creates a Parcel on the TShip API. This function uses a generic type to represent the model of the metadata attached to the Parcel.
    /// - Parameters:
    ///   - request: Request body with details used to create a Parcel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Parcel if no error occurred.
    func createParcel<T: Codable>(request: ParcelRequest<T>, runCompletionOnUIThread: Bool, completion: @escaping(Result<Parcel<T>, Error>) -> Void){
        self.request(route: Route.parcels(), method: Method.post, requestBody: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Parcel<T>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This functions gets a Parcel previously created on the TShip API.
    /// - Parameters:
    ///   - parcelId: Unique id used to identify the parcel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getParcel<T: Codable>(parcelId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Parcel<T>, Error>) -> Void){
        self.request(route: Route.parcels(parcelId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Parcel<T>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches an Parcel previously created on the TShip API.
    /// - Parameters:
    ///   - request: Should contain the query parameters for paginating through the Parcels. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getParcels<T: Codable>(request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<GetParcelsResponseData<T>, Error>) -> Void){
        self.request(route: Route.parcels(), method: Method.get, queryParameters: request,runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetParcelsResponseData<T>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This updates an Parcel previously created on the TShip API.
    /// - Parameters:
    ///   - parcelId: Unique id used to identify the parcel.
    ///   - request: Request body with all the Parcel details to update the Parcel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the updated Parcel if no error occurred.
    func updateParcel<T: Codable>(parcelId: String, request: ParcelRequest<T>, runCompletionOnUIThread: Bool, completion: @escaping(Result<Parcel<T>, Error>) -> Void){
        self.request(route: Route.parcels(parcelId), method: Method.put, requestBody: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Parcel<T>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
