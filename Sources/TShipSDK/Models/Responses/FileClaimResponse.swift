//
//  FileClaimResponse.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

public struct FileClaimResponse: Decodable{
    
    let description: String
    
    let insuranceId: String
    
    let reason: ClaimReason
    
    let signature: String
    
    let status: String
    
    let witnesses: [[String]]
    
    let claimId: String
    
    private enum CodingKeys: String, CodingKey {
        
        case description, reason, signature, status, witnesses
        
        case claimId = "claim_id"
        
        case insuranceId = "insurance"
        
    }
    
}
