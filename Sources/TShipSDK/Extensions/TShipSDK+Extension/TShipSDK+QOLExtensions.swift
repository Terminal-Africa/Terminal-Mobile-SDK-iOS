//
//  File.swift
//  
//
//  Created by maxSpane on 16/12/2022.
//

public extension TShipSDK {
    
    //TODO: Replace packaging id with the correct packagin
    func getRatesForShipmentShorthand(pickupAddress: AddressRequestBuilder, deliveryAddress: AddressRequestBuilder, weight: Double, packagingId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        let fillerParcelItemDesc = "Dummy parcel for getting rates quickly before user login"
        var pickupAddressId = ""
        var deliveryAddressId = ""
        createAddress(
            request:
                pickupAddress.build(),
            runCompletionOnUIThread: runCompletionOnUIThread
        ) {
            (result) in
                switch result {
                case .success(let response):
                    pickupAddressId = response.addressId
                    self.createAddress(
                        request:
                            deliveryAddress.build(),
                        runCompletionOnUIThread: runCompletionOnUIThread
                    ){
                        (result) in
                        switch result {
                        case .success(let response):
                            deliveryAddressId = response.addressId
                            self.createParcel(
                                request: ParcelRequest(
                                    description: fillerParcelItemDesc,
                                    packagingId: packagingId,
                                    currency: .NGN)
                                .withItem(name: fillerParcelItemDesc, description: fillerParcelItemDesc, quantity: 1, value: 10, weight: weight)
                            ){
                                (result) in
                                switch result {
                                case .success(let response):
                                    let parcelId = response.parcelId
                                    self.getRatesForShipment(
                                        request: GetRateForShipmentRequest(
                                            pickupAddressId: pickupAddressId,
                                            deliveryAddressId: deliveryAddressId,
                                            parcelId: parcelId
                                        )
                                    ){
                                        (result) in
                                        completion(result)
                                    }
                                case .failure(let error):
                                    completion(Result.failure(error))
                                }
                            }
                        case .failure(let error):
                            completion(Result.failure(error))
                        }
                    }
                case .failure(let error):
                    completion(Result.failure(error))
                }
        }
    }
    
}
