//
//  VerifyNINRequest.swift
//  TShipSDK
//

/// Request body used to verify the sender at an existing address with their NIN.
struct VerifyNINRequest: Encodable {
    let nin: String
}
