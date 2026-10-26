//
//  SenderVerificationStatus.swift
//  TShipSDK
//

/// The verification status of the sender at an Address.
public enum SenderVerificationStatus: String, SafeDecodableEnum {
    case unverified
    case pending
    case verified
    case failed
    
    static var unknownCase: SenderVerificationStatus { .unverified }
}
