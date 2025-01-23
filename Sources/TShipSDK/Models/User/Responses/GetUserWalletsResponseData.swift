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
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wallets = (try? container.decode([TShipWallet].self, forKey: .wallets)) ?? []
    }
    
    private enum CodingKeys: String, CodingKey {
        case wallets = "docs"
    }
}
