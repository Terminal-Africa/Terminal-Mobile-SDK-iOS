//
//  TShipSDK+InsuranceRemoteExtensions.swift
//  
//
//  Created by maxSpane on 05/01/2023.
//

public extension TShipSDK {
    
    func getInsurancePremium(request: GetInsurancePremiumRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<InsurancePremium, Error>) -> Void){
        insuranceRemote.getInsurancePremium(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getInsurancePremiumWithParcelValue(request: GetInsurancePremiumRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<InsurancePremium, Error>) -> Void){
        insuranceRemote.getInsurancePremiumWithParcelValue(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getInsuranceDetails(shipmentId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Insurance, Error>) -> Void){
        insuranceRemote.getInsuranceDetails(shipmentId: shipmentId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
