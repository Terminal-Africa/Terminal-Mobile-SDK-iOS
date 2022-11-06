
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
    
}
