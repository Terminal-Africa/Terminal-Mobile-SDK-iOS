//
//  FileClaimRequest.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

public class FileClaimRequest: Encodable {
    
    var insuranceId: String
    
    var claim: ClaimRequest
    
    public init(insuranceId: String, claim: ClaimRequest) {
        self.insuranceId = insuranceId
        self.claim = claim
    }
    
    private enum CodingKeys: String, CodingKey {
        case insuranceId = "insurance"
        case claim
    }
    
}
