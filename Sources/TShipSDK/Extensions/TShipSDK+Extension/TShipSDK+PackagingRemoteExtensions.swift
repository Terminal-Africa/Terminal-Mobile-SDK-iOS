/// Extensions for Packaging remote methods on TShipSDK
public extension TShipSDK {
    
    /// This function creates a Packaging on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create a Packaging. All the parameters that are available to add to Packaging are required to create a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Packaging if no error occurred.
    func createPackaging(request: PackagingRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.createPackaging(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getPackaging(packagingId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.getPackaging(packagingId: packagingId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches the list of Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - request: Should contain the query parameters for paginating through the Packaging. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside the GetMultiplePackagingResponseData which contains the paginated Packaging, if no error occurred.
    func getMultiplePackaging(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetMultiplePackagingResponseData, Error>) -> Void){
        packagingRemote.getMultiplePackaging(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function updates a Packaging on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaing.
    ///   - request: Request body with details used to update a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the updated Packaging, if no error occurred.
    func updatePackaging(packagingId: String, request: PackagingRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.updatePackaging(packagingId: packagingId, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function deletes a Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the deleted Packaging if no error occurred.
    func deletePackaging(packagingId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.deletePackaging(packagingId: packagingId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
