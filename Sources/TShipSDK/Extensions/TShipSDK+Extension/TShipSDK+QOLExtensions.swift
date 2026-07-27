//
//  File.swift
//  
//
//  Created by maxSpane on 16/12/2022.
//

public extension TShipSDK {
    
    /// Fetches a quick shipment quote using inline addresses and a minimal parcel.
    ///
    /// The generated parcel uses NGN, a nominal item value, and Nigeria as the
    /// manufacturer country. Use ``getQuotesForShipment(request:runCompletionOnUIThread:completion:)``
    /// when those values must be controlled.
    func getRatesForShipmentShorthand(pickupAddress: AddressRequest, deliveryAddress: AddressRequest, weight: Double, packagingId: String? = nil, itemType: ParcelItemType = .parcel, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        let fillerParcelItemDesc = "Dummy parcel for getting rates quickly before user login"
        let parcel: ParcelRequest = ParcelRequest(
            description: fillerParcelItemDesc,
            packagingId: packagingId,
            currency: .NGN)
            .withItem(name: fillerParcelItemDesc, description: fillerParcelItemDesc, quantity: 1, value: 10, weight: weight, type: itemType, manufacturerCountry: "NG")
        
        getQuotesForShipment(
            request: GetShipmentQuotesRequest(
                pickupAddress: pickupAddress,
                deliveryAddress: deliveryAddress,
                parcel: parcel
            ),
            runCompletionOnUIThread: runCompletionOnUIThread,
            completion: completion
        )
        
    }
    
    /// Builds the inline request used to obtain a quick shipment quote.
    ///
    /// The request contains a single minimal parcel item with a nominal value
    /// and Nigeria as its manufacturer country.
    /// - Returns: A request suitable for ``getQuotesForShipment(request:runCompletionOnUIThread:completion:)``.
    func generateGetShipmentQuotesRequest(pickupAddress: AddressRequest, deliveryAddress: AddressRequest, weight: Double, packagingId: String? = nil, itemType: ParcelItemType = .parcel, currency: Currency = .NGN) -> GetShipmentQuotesRequest{
        let fillerParcelItemDesc = "Dummy parcel for getting rates quickly before user login"
        let parcel: ParcelRequest = ParcelRequest(
            description: fillerParcelItemDesc,
            packagingId: packagingId,
            currency: .NGN)
            .withItem(name: fillerParcelItemDesc, description: fillerParcelItemDesc, quantity: 1, value: 10, weight: weight, type: itemType, manufacturerCountry: "NG")
        
        return GetShipmentQuotesRequest(
            pickupAddress: pickupAddress,
            deliveryAddress: deliveryAddress,
            parcel: parcel,
            currency: currency
        )
    }
    
}
