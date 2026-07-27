//
//  TShipSDK+InsuranceRemoteExtensions.swift
//  
//
//  Created by maxSpane on 05/01/2023.
//

public extension TShipSDK {
    
    /// Calculates the insurance premium for a shipment.
    /// - Parameter request: The shipment and insurance details used to calculate the premium.
    func getInsurancePremium(request: GetInsurancePremiumRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<InsurancePremium, Error>) -> Void){
        insuranceRemote.getInsurancePremium(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Calculates an insurance premium directly from a declared parcel value.
    /// - Parameter request: The parcel value, currency, and insurance type to quote.
    func getInsurancePremiumWithParcelValue(request: GetInsurancePremiumRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<InsurancePremium, Error>) -> Void){
        insuranceRemote.getInsurancePremiumWithParcelValue(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches the insurance policy associated with a shipment.
    /// - Parameter shipmentId: The shipment identifier whose insurance details are requested.
    func getInsuranceDetails(shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Insurance, Error>) -> Void){
        insuranceRemote.getInsuranceDetails(shipmentId: shipmentId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
