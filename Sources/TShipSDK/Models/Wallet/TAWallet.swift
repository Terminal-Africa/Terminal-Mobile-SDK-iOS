//
//  TAWallet.swift
//
//
//  Created by maxSpane on 23/02/2024.
//

/// Data model representing a TShip Wallet
public struct TShipWallet: Decodable, Equatable {
    
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
    
    /// The amount of money yet to be credited into the wallet
    public let pendingBalance: Double?
    
    /// The name of the bank attached to the account number used to fund the wallet
    public let bankName: String
    
    /// The currency the wallet is in
    public let currency: Currency
    
    /// The ways the wallet can be topped up
    public let topUpMethods: [TopUpMethod]
    
    /// The type of the wallet
    public let type: WalletType
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(String.self, forKey: .id)) ?? ""
        self.isActive = (try? container.decode(Bool.self, forKey: .isActive)) ?? true
        self.accountName = (try? container.decode(String.self, forKey: .accountName)) ?? ""
        self.accountNumber = (try? container.decode(String.self, forKey: .accountNumber)) ?? ""
        self.amount = (try? container.decode(Double.self, forKey: .amount)) ?? 0
        self.pendingBalance = try? container.decodeIfPresent(Double.self, forKey: .pendingBalance)
        self.bankName = (try? container.decode(String.self, forKey: .bankName)) ?? ""
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.topUpMethods = (try? container.decode([TopUpMethod].self, forKey: .topUpMethods)) ?? []
        self.type = (try? container.decode(WalletType.self, forKey: .type)) ?? .staticWallet
    }
    
    private enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case accountName = "account_name"
        case accountNumber = "account_number"
        case bankName = "bank_name"
        case pendingBalance = "pending_balance"
        case id, amount, currency, topUpMethods, type
        
    }
}
