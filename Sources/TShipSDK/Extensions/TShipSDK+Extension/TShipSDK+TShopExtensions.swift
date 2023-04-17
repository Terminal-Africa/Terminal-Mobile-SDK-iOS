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
    
}
