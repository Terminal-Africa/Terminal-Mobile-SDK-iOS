/// Remote class that provides functions to make requests to the shipments route.
class ShipmentsRemote: NetworkService {
    
    /// This creates a Shipment on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create a Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Shipment if no error occurred.
    func createShipment<ParcelM: Codable>(request: ShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<ParcelM>, Error>) -> Void){
        self.request(route: Route.shipments(), method: Method.post, requestBody: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
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
    
    /// This function fetches Shipments previously created on the TShip API with the Shipment.
    /// - Parameters:
    ///   - request: Contain the query parameters for paginating through the Shipments.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getShipments(request: PaginatedRequestBuilder, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetShipmentsResponseData, Error>) -> Void){
        self.request(route: Route.shipments(), method: Method.get, queryParameters: request.build(),runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetShipmentsResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function fetches Shipments previously created on the TShip API with the Shipment populated with details for addresses, carriers and parcel.
    /// - Parameters:
    ///   - request: Contain the query parameters for paginating through the Shipments.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getPopulatedShipments<ParcelM: Codable>(request: PaginatedRequestBuilder, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetPopulatedShipmentsResponseData<ParcelM>, Error>) -> Void){
        var queryParams = request.build()
        queryParams["populate"] = true
        self.request(route: Route.shipments(), method: Method.get, queryParameters: queryParams,runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetPopulatedShipmentsResponseData<ParcelM>>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function tracks a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - shipmentId: The id of the Shipment to track.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func trackShipment(shipmentId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentTrackingInfo, Error>) -> Void){
        self.request(route: Route.trackShipment(shipmentId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ShipmentTrackingInfo>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function arranges pickup and delivery of a Shipment.
    /// - Parameters:
    ///   - request: An instance of ArrangeShipmentRequest that contains all the information required to arrange a shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func arrangeShipment(request: ArrangeShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void){
        self.request(route: Route.arrangeShipment, method: Method.post, requestBody: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ShipmentUnpopulated>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This function arranges pickup and delivery of a Shipment.
    /// - Parameters:
    ///   - request: An instance of CancelShipmentRequest that contains all the information required to cancel a shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func cancelShipment(request: CancelShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void){
        self.request(route: Route.cancelShipment, method: Method.post, requestBody: codableClassToDict(model: request), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ShipmentUnpopulated>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
