/// Extensions for Rates remote methods on TShipSDK.
public extension TShipSDK {
    
    /// Fetches rates for a shipment and parcel.
    /// - Parameters:
    ///   - request: Request with parameters needed to get shipment rate.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status alongside the rates for the shipment, if no error occurred.
    func getRatesForShipment(request: GetRateForShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        ratesRemote.getRatesForShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches rates for a shipment containing multiple parcels.
    /// - Parameter request: The shipment addresses, parcels, and currency to quote.
    func getRatesForMultiParcelShipment(request: GetRatesForMultiParcelShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        ratesRemote.getRatesForMultiParcelShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Quotes a shipment from inline address and parcel details.
    ///
    /// Unlike ``getRatesForShipment(request:runCompletionOnUIThread:completion:)``,
    /// this operation does not require previously created address or parcel identifiers.
    func getQuotesForShipment(request: GetShipmentQuotesRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        ratesRemote.getQuotesForShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
