/// Extensions for Packaging remote methods on TShipSDK
public extension TShipSDK {
    
    /// This function creates a Packaging on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create a Packaging.. All the parameters that are available to add to Packaging are required to create a Packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Packaging if no error occurred.
    func createPackaging(request: PackagingRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.createPackaging(secretKey: secretKey, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a Packaging previously created on the TShip API.
    /// - Parameters:
    ///   - packagingId: Unique id used to identify the packaging.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getPackaging(packagingId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Packaging, Error>) -> Void){
        packagingRemote.getPackaging(secretKey: secretKey, packagingId: packagingId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
