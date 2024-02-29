//
//  TAWallet.swift
//
//
//  Created by maxSpane on 23/02/2024.
//

/// Data model representing a TShip Wallet
public struct TShipWallet: Decodable {
    
    /// The wallet's id
    public let id: String
    
    /// Indicates if the wallet is active
    public let isActive: Bool
    
    /// The name on the account that will show when the account number is queried
    public let accountName: String
    
    /// The account number that can be used to fund the wallet with bank transfer
    public let accountNumber: String
    
    /// The amount of money currently in the wallet
    public let amount: Double
    
    /// The name of the bank attached to the account number used to fund the wallet
    public let bankName: String
    
    /// The currency the wallet is in
    public let currency: Currency
    
    /// The ways the wallet can be topped up
    public let topUpMethods: [TopUpMethod]
    
    /// The type of the wallet
    public let type: WalletType
    
    private enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case accountName = "account_name"
        case accountNumber = "account_number"
        case bankName = "bank_name"
        case id, amount, currency, topUpMethods, type
        
    }
}
