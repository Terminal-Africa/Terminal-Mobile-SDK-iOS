//
//  TShipSDK+TShopExtensions.swift
//  
//
//  Created by maxSpane on 14/04/2023.
//

/// Extensions for TShop operations on TShipSDK
public extension TShipSDK {
    
    func getAvailableTShopAddresses(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[TShopAddress], Error>) -> Void){
        tShopRemote.getAvailableAddresses(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getTShopTerminalReferenceAddress(tShopId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        tShopRemote.getTerminalReferenceAddress(tShopId: tShopId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getTShopRate(request: GetTShopRateRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        tShopRemote.getRate(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func chargeTShopShipment(request: ChargeTShopShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ChargeTShopShipmentResponse, Error>) -> Void){
        tShopRemote.chargeShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
