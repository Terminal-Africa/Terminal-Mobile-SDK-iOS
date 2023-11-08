//
//  File.swift
//  
//
//  Created by maxSpane on 16/12/2022.
//

public extension TShipSDK {
    
    //TODO: Replace packaging id with the correct packagin
    func getRatesForShipmentShorthand(pickupAddress: AddressRequest, deliveryAddress: AddressRequest, weight: Double, packagingId: String? = nil, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        let fillerParcelItemDesc = "Dummy parcel for getting rates quickly before user login"
        let parcel: ParcelRequest = ParcelRequest(
            description: fillerParcelItemDesc,
            packagingId: packagingId,
            currency: .NGN)
            .withItem(name: fillerParcelItemDesc, description: fillerParcelItemDesc, quantity: 1, value: 10, weight: weight)
        
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
    
}
