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
    
}
