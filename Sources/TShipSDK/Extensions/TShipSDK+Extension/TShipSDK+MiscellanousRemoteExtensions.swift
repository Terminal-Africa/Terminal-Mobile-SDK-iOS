/// Extensions for Miscellanous remote methods on TshipSDK
public extension TShipSDK {
    
    /// This function fetches all the countries valid on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getValidCountries(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Country], Error>) -> Void){
        miscellanousRemote.getValidCountries(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches all the states within a country valid on the TShip API.
    /// - Parameters:
    ///   - request: Request body with country code for states to get.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getValidStates(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[State], Error>) -> Void){
        miscellanousRemote.getValidStates(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches all the cities within a state valid on the TShip API.
    /// - Parameters:
    ///   - request: Request body with country and state code for cities to get.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getValidCities(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[City], Error>) -> Void){
        miscellanousRemote.getValidCities(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
