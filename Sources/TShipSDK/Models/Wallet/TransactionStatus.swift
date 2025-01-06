//
//  TransactionStatus.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 19/12/2024.
//

public enum TransactionStatus: String, Decodable {
    case pending, confirmed, declined, successful, success, failed
}
