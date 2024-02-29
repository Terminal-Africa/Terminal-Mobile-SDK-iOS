//
//  GetUserWalletsResponseData.swift
//
//
//  Created by maxSpane on 23/02/2024.
//

/// Response data from the get wallets endpoint
public struct GetUserWalletsResponseData: Decodable {
    
    /// List of wallets attached to the user's account
    let wallets: [TShipWallet]
    
    private enum CodingKeys: String, CodingKey {
        case wallets = "docs"
    }
}
