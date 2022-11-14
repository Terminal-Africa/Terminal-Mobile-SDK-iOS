/// Extensions for Shipments remote methods on TShipSDK
public extension TShipSDK {
    
    /// This function creates a Shipment on the TShip API.
    /// - Parameters:
    ///   - parcelMetadataType: The metatype of the metadata model struct/class attached to the Parcel in the Shipment. You can omit this value if you didn't attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - request: Request body with details used to create a Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Shipment if no error occurred.
    func createShipment<ParcelM: Codable>(_ parcelMetadataType: ParcelM.Type = EmptyMetadata.self, request: ShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void){
        shipmentsRemote.createShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a Shipment previously created on the TShip API.
    /// - Parameters:
    ///   - parcelMetadataType: The metatype of the metadata model struct/class attached to the Parcel in the Shipment. You can omit this value if you didn't attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - shipmentId: Unique id used to identify the Shipment.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the Shipment if no error occurred.
    func getShipment<ParcelM: Codable>(_ parcelMetadataType: ParcelM.Type = EmptyMetadata.self, shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void){
        shipmentsRemote.getShipment(shipmentId: shipmentId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
   
}
