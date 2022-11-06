/// Extensions for Parcels remote methods on TShipSDK.
public extension TShipSDK {
    
    /// This function creates a Parcel on the TShip API.
    /// - Parameters:
    ///   - metadataType: The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - request: Request body with details used to create a Parcel. All the parameters that are available to add to the ParcelRequest are required to create a Parcel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Parcel if no error occurred.
    func createParcel<T: Codable>(_ metadataType: T.Type = EmptyMetadata.self, request: ParcelRequest<T>, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Parcel<T>, Error>) -> Void){
        parcelRemote.createParcel(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of a Parcel previously created on the TShip API.
    /// - Parameters:
    ///   - metadataType: The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you no metadata is attached to the Parcel. The default type of the metadata is EmptyMetadata.self, EmptyMetadata being an empty struct.
    ///   - parcelId: Unique id used to identify the parcel.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the Parcel if no error occurred.
    func getParcel<T: Codable>(_ metadataType: T.Type = EmptyMetadata.self, parcelId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Parcel<T>, Error>) -> Void){
        parcelRemote.getParcel(parcelId: parcelId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
