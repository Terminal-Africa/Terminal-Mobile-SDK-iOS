//
//  AddressType.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 07/08/2025.
//

public enum AddressType: String, SafeDecodableEnum {
    case TplHub = "3pl_hub"
    case UserAddress = "user_address"
    
    static var unknownCase: AddressType { .UserAddress }
}

protocol SafeDecodableEnum: RawRepresentable, CaseIterable, Codable where RawValue: Codable {
    static var unknownCase: Self { get }
}

extension SafeDecodableEnum {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self = Self(rawValue: rawValue) ?? Self.unknownCase
    }
}
