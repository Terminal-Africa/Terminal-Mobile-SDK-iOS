/// Extensions for Rates remote methods on TShipSDK.
public extension TShipSDK {
    
    /// This function gets the rates for a shipment using the TShip API.
    /// - Parameters:
    ///   - request: Request with parameters needed to get shipment rate.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status alongside the rates for the shipment, if no error occurred.
    func getRatesForShipment(request: GetRateForShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        ratesRemote.getRatesForShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getRatesForMultiParcelShipment(request: GetRatesForMultiParcelShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        ratesRemote.getRatesForMultiParcelShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
