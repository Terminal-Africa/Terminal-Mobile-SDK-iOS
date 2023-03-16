//
//  Claim.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

public struct Claim: Decodable {
    
    public let description: String
    
//    let insurance: Insurance
    
    public let reason: ClaimReason
    
    public let signature: String
    
    public let status: ClaimStatus
    
    public let witnesses: [[String]]
    
    public let claimId: String
    
    private enum CodingKeys: String, CodingKey {
        
        case description, reason, signature, status, witnesses
        
        case claimId = "claim_id"
        
    }
    
}
