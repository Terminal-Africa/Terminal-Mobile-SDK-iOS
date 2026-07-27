//
//  Claim.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

/// An insurance claim filed for a shipment.
public struct Claim: Decodable {
    
    public let description: String
    
//    let insurance: Insurance
    
    public let reason: ClaimReason
    
    public let signature: String
    
    public let status: ClaimStatus
    
    public let witnesses: [[String]]
    
    public let claimId: String
    
    public let createdAt: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.reason = (try? container.decode(ClaimReason.self, forKey: .reason)) ?? .lostInTransit
        self.signature = (try? container.decode(String.self, forKey: .signature)) ?? ""
        self.status = (try? container.decode(ClaimStatus.self, forKey: .status)) ?? .pending
        self.witnesses = (try? container.decode([[String]].self, forKey: .witnesses)) ?? []
        self.claimId = (try? container.decode(String.self, forKey: .claimId)) ?? ""
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case description, reason, signature, status, witnesses
        
        case claimId = "claim_id"
        
        case createdAt = "created_at"
        
    }
    
}
