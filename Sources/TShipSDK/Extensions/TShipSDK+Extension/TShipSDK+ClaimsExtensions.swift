//
//  TShipSDK+ClaimsExtensions.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

public extension TShipSDK {
    
    /// Files an insurance claim for a shipment.
    /// - Parameter request: The claim evidence and shipment details to submit.
    func fileClaim(request: FileClaimRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<FileClaimResponse, Error>) -> Void){
        claimsRemote.fileClaim(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches an insurance claim by identifier.
    /// - Parameter id: The claim identifier.
    func getClaim(id: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Claim, Error>) -> Void){
        claimsRemote.getClaim(id: id, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
