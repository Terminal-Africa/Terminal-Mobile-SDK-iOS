/// Extensions for Address remote methods on TshipSDK
public extension TShipSDK {
    
    /// This function creates an Address on the TShip API.
    /// - Parameters:
    ///   - request: Request body with details used to create Address. This should be created with the AddressRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func createAddress(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.createAddress(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details of an  Address on the TShip API.
    /// - Parameters:
    ///   - addressId: Unique id used to identify the address.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the newly created Address if no error occurred.
    func getAddress(addressId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.getAddress(addressId: addressId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches Addresses previously created on the TShip API.
    /// - Parameters:
    ///   - request: Should contain the query parameters for paginating through the Addresses. This should be created with the PaginatedRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing the response status alongside the GetAddressResponseData which contains the paginated Address, if no error occurred.
    func getAddresses(request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetAddressResponseData, Error>) -> Void){
        addressesRemote.getAddresses(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This updates an Address previously created on the TShip API.
    /// - Parameters:
    ///   - addressId: Unique id used to identify the address.
    ///   - request: Request body with the Address details you want to update. This should be created with the AddressRequestBuilder class.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and the updated Address if no error occurred.
    func updateAddress(addressId: String, request: [String: Any], runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        addressesRemote.updateAddress(addressId: addressId, request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
