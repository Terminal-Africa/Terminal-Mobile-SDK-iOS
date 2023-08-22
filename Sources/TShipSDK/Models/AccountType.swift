//
//  AccountType.swift
//  
//
//  Created by maxSpane on 09/08/2023.
//


public enum AccountType: String, Codable {
    
    case individual
    
    case merchant
    
    case tpl = "3pl"
    
    case platform
}
