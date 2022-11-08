/// Remote class that provides functions to make requests to the rates route.
class RatesRemote: NetworkService {
    
    /// This function fetches Rates from various couriers using the TShip API.
    /// - Parameters:
    ///   - request: Request with parameters needed to get shipment rate.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getRatesForShipment(request: GetRateForShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<[Rate], Error>) -> Void){
        self.request(route: Route.shipmentRates, method: Method.get, queryParameters: codableClassToDict(model: request),runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[Rate]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
