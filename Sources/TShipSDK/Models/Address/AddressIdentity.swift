//
//  AddressIdentity.swift
//  TShipSDK
//

/// Details of the identity verification attached to an Address.
public struct AddressIdentity: Codable, Equatable {
    
    /// Unique id used to identify the identity record.
    public let identityId: String
    
    /// The verification status of the identity.
    public let status: SenderVerificationStatus
    
    /// The provider that verified the identity.
    public let provider: String?
    
    private enum CodingKeys: String, CodingKey {
        case identityId = "identity_id"
        case status, provider
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identityId = try container.decodeIfPresent(String.self, forKey: .identityId) ?? ""
        self.status = (try? container.decode(SenderVerificationStatus.self, forKey: .status)) ?? .unverified
        self.provider = try? container.decodeIfPresent(String.self, forKey: .provider)
    }
}
