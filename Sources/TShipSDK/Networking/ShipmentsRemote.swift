/// Remote class that provides functions to make requests to the shipments route.
class ShipmentsRemote: NetworkService {
    
    /// This creates a Shipment on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create a Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Shipment if no error occurred.
    func createShipment<ParcelM: Codable>(request: ShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<ParcelM>, Error>) -> Void){
        self.request(route: Route.shipments(), method: Method.post, requestBody: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ShipmentPopulatedWithPackagingData<ParcelM>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This fetches a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - shipmentId: Unique id used to identify the Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getShipment<ParcelM: Codable>(shipmentId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<ParcelM>, Error>) -> Void){
        self.request(route: Route.shipments(shipmentId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ShipmentPopulatedWithPackagingData<ParcelM>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
