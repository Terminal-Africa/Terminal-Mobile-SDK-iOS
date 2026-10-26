//
//  VerifyNINResult.swift
//  TShipSDK
//

import Foundation

/// The result of verifying the sender at an address with their NIN.
public struct VerifyNINResult {
    
    /// The address after verification. Read ``Address/verificationStatus`` to get the outcome.
    public let address: Address
    
    /// Indicates whether a NIN already verified on the account was reused. Reusing a verified NIN is not charged.
    public let reused: Bool
    
    /// Message returned by the API.
    public let message: String
}

/// Response returned by the verify NIN route.
struct VerifyNINResponse: Decodable {
    let status: Bool
    let message: String
    let data: Address
    let reused: Bool?
    
    var result: VerifyNINResult {
        let messageMentionsReuse = message.range(of: "existing identity", options: .caseInsensitive) != nil
        return VerifyNINResult(address: data, reused: (reused ?? false) || messageMentionsReuse, message: message)
    }
}
