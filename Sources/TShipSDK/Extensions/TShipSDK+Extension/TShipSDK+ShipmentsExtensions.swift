/// Extensions for Shipments remote methods on TShipSDK
public extension TShipSDK {
    
    /// This function creates a Shipment on the TShip API.
    /// - Parameters:
    ///   - parcelMetadataType: The metatype of the metadata model struct/class attached to the Parcel in the Shipment. You can omit this value if you didn't attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - request: Request body with details used to create a Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Shipment if no error occurred.
    func createShipment<ParcelM: Codable>(_ parcelMetadataType: ParcelM.Type = EmptyMetadata.self, request: CreateShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<ParcelM>, Error>) -> Void){
        shipmentsRemote.createShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - parcelMetadataType: The metatype of the metadata model struct/class attached to the Parcel in the Shipment. You can omit this value if you didn't attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - shipmentId: Unique id used to identify the Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the Shipment if no error occurred.
    func getShipment<ParcelM: Codable>(_ parcelMetadataType: ParcelM.Type = EmptyMetadata.self, shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<ParcelM>, Error>) -> Void){
        shipmentsRemote.getShipment(shipmentId: shipmentId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches Shipments previously created on the TShip API with the Shipment.
    /// - Parameters:
    ///   - request: Contains the query parameters for paginating through the Shipments. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of GetShipmentsResponseData which contains the paginated ShipmentPopulatedWithoutPackagingData, if no error occurred.
    func getShipments(request: GetShipmentsRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetShipmentsResponseData, Error>) -> Void){
        shipmentsRemote.getShipments(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches Shipments previously created on the TShip API with the Shipment populated with details for addresses, carriers and parcel.
    /// - Parameters:
    ///   - parcelMetadataType: The metatype of the metadata model struct/class attached to the Parcel in the Shipment. You can omit this value if you didn't attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - request: Contains the query parameters for paginating through the Shipments. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of GetShipmentsResponseData which contains the paginated ShipmentPopulatedWithoutPackagingData, if no error occurred.
    func getPopulatedShipments<ParcelM: Codable>(_ parcelMetadataType: ParcelM.Type = EmptyMetadata.self, request: GetShipmentsRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetPopulatedShipmentsResponseData<ParcelM>, Error>) -> Void){
        shipmentsRemote.getPopulatedShipments(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function tracks a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - shipmentId: The id of the Shipment to track.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of ShipmentTrackingInfo which contains all the information needed to track the shipment, if no error occurred.
    func trackShipment(shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentTrackingInfo, Error>) -> Void){
        shipmentsRemote.trackShipment(shipmentId: shipmentId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function arranges pickup and delivery of a Shipment.
    /// - Parameters:
    ///   - request: An instance of ArrangeShipmentRequest that contains all the information required to arrange a shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of ShipmentUnpopulated which contains information about the newly arranged shipment, if no error occurred.
    func arrangeShipment(request: ArrangeShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void){
        shipmentsRemote.arrangeShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function cancels a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - shipmentId: The id of the Shipment to cancel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of ShipmentUnpopulated which contains information about the cancelled shipment, if no error occurred.
    func cancelShipment(shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void){
        shipmentsRemote.cancelShipment(request: CancelShipmentRequest(shipmentId: shipmentId), runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function updates a Shipment previously created on the TShip API. Note that shipments that have already been arranged can't be updated.
    /// - Parameters:
    ///   - shipmentId: The id of the Shipment to update.
    ///   - request: An instance of UpdateShipmentRequest that contains all the information required to update a shipment..
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside an instance of ShipmentUnpopulated which contains information about the updated shipment, if no error occurred.
    func updateShipment(shipmentId: String, request: UpdateShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentPopulatedWithPackagingData<EmptyMetadata>, Error>) -> Void){
        shipmentsRemote.updateShipment( shipmentId: shipmentId, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
