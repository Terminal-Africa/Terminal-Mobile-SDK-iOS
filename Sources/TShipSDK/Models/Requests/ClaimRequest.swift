//
//  ClaimRequest.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

public struct ClaimRequest: Encodable {
    
    public var description: String
    
    public var reason: ClaimReason
    
    public var witnesses: [[String]]
    
    public var signature: String
    
    public init(description: String, reason: ClaimReason, witnesses: [[String]], signature: String) {
        self.description = description
        self.reason = reason
        self.witnesses = witnesses
        self.signature = signature
    }
    
}
