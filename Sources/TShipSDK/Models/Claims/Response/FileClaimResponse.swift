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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.insuranceId = (try? container.decode(String.self, forKey: .insuranceId)) ?? ""
        self.reason = (try? container.decode(ClaimReason.self, forKey: .reason)) ?? .lostInTransit
        self.signature = (try? container.decode(String.self, forKey: .signature)) ?? ""
        self.status = (try? container.decode(String.self, forKey: .status)) ?? ""
        self.witnesses = (try? container.decode([[String]].self, forKey: .witnesses)) ?? []
        self.claimId = (try? container.decode(String.self, forKey: .claimId)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case description, reason, signature, status, witnesses
        
        case claimId = "claim_id"
        
        case insuranceId = "insurance"
        
    }
    
}
