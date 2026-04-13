//
//  DutyPayer.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/12/2025.
//

public enum DutyPayer: String, Codable {
    case accountHolder = "account_holder"
    case sender
    case receiver
    case noOne = "none"
}
