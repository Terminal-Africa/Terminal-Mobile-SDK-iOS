/// Extensions for Miscellanous remote methods on TshipSDK
public extension TShipSDK {
    
    /// This function fetches all the countries valid on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getValidCountries(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Country], Error>) -> Void){
        miscellanousRemote.getValidCountries(secretKey: secretKey, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
