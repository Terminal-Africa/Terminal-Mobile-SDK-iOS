//
//  EnabledCarriers.swift
//  
//
//  Created by maxSpane on 25/01/2023.
//

public struct EnabledCarriers: Codable {
    
    /// List of ids for the carriers that are enabled for domestic shipments
    public let domestic: [String]
    
    /// List of ids for the carriers that are enabled for regional shipments
    public let regional: [String]
    
    /// List of ids for the carriers that are enabled for international shipments
    public let international: [String]
    
}
