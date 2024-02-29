//
//  TopUpMethod.swift
//
//
//  Created by maxSpane on 23/02/2024.
//

/// Enum representing the methods a wallet can be topped up
public enum TopUpMethod: String, Codable {
    
    /// This indicates that the card can be topped up with a card
    case card
    
    /// This indicates that the card can be topped up with a bank transfer
    case bankTransfer = "bank-transfer"
}
