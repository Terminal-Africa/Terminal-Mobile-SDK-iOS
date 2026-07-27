//
//  TShipSDK+TShopExtensions.swift
//  
//
//  Created by maxSpane on 14/04/2023.
//

/// Extensions for TShop operations on TShipSDK
public extension TShipSDK {
    
    /// Fetches the pickup addresses available to TShop shipments.
    func getAvailableTShopAddresses(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[TShopAddress], Error>) -> Void){
        tShopRemote.getAvailableAddresses(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches the Terminal reference address for a TShop.
    /// - Parameter tShopId: The TShop identifier.
    func getTShopTerminalReferenceAddress(tShopId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Address, Error>) -> Void){
        tShopRemote.getTerminalReferenceAddress(tShopId: tShopId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches shipping rates for a TShop shipment.
    func getTShopRate(request: GetTShopRateRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        tShopRemote.getRate(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Charges a TShop shipment using the supplied rate and shipment details.
    func chargeTShopShipment(request: ChargeTShopShipmentRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<ChargeTShopShipmentResponse, Error>) -> Void){
        tShopRemote.chargeShipment(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Checks whether a TShop referral code has already been used.
    func verifyReferralCodeUsed(referralCode: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<VerifyReferralCodeUsedResponse, Error>) -> Void){
        tShopRemote.verifyReferralCodeUsed(referralCode: referralCode, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches a quote from inline addresses and parcel information without creating resources first.
    func getTShopQuickQuote(request: GetTShopQuickQuoteRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[Rate], Error>) -> Void){
        tShopRemote.getQuote(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
