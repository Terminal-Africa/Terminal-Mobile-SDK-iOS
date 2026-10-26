import XCTest
@testable import TShipSDK

final class SenderVerificationTests: XCTestCase {
    
    private func decodeAddress(_ json: String) throws -> Address {
        return try JSONDecoder().decode(Address.self, from: Data(json.utf8))
    }
    
    func testAddressWithoutVerificationFieldsIsUnverified() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"NG","first_name":"Ifeoma"}"#)
        XCTAssertFalse(address.isVerified)
        XCTAssertNil(address.verifiedAt)
        XCTAssertNil(address.identity)
        XCTAssertEqual(address.verificationStatus, .unverified)
        XCTAssertFalse(address.isVerifiedSender)
    }
    
    func testVerifiedFlagIsUsedWhenIdentityIsAbsent() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"NG","verified":true,"verified_at":"2026-10-01T10:00:00Z"}"#)
        XCTAssertEqual(address.verificationStatus, .verified)
        XCTAssertEqual(address.verifiedAt, "2026-10-01T10:00:00Z")
        XCTAssertTrue(address.isVerifiedSender)
    }
    
    func testIdentityStatusTakesPrecedenceOverVerifiedFlag() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"NG","verified":true,"identity":{"identity_id":"ID-1","status":"failed","provider":"youverify","first_name":"X","last_name":"Y"}}"#)
        XCTAssertEqual(address.identity?.identityId, "ID-1")
        XCTAssertEqual(address.identity?.provider, "youverify")
        XCTAssertEqual(address.verificationStatus, .failed)
        XCTAssertFalse(address.isVerifiedSender)
    }
    
    func testUnknownIdentityStatusFallsBackToUnverified() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"NG","identity":{"identity_id":"ID-1","status":"something_new"}}"#)
        XCTAssertEqual(address.verificationStatus, .unverified)
    }
    
    func testVerifiedNonNigerianAddressIsNotAVerifiedSender() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"GH","verified":true}"#)
        XCTAssertEqual(address.verificationStatus, .verified)
        XCTAssertFalse(address.isVerifiedSender)
    }
    
    func testAddressVerificationStateSurvivesEncodingRoundTrip() throws {
        let address = try decodeAddress(#"{"address_id":"AD-1","country":"NG","verified":true,"verified_at":"2026-10-01","identity":{"identity_id":"ID-1","status":"verified"}}"#)
        let decoded = try JSONDecoder().decode(Address.self, from: JSONEncoder().encode(address))
        XCTAssertEqual(decoded, address)
        XCTAssertTrue(decoded.isVerifiedSender)
    }
    
    func testAddressRequestOmitsNINWhenNotSet() {
        let body = AddressRequest(city: "Ikeja", state: "Lagos", country: "NG")
            .withDetailsForUserAtAddress(firstName: "Ifeoma", lastName: "Adebayo")
            .build()
        XCTAssertNil(body["nin"])
        XCTAssertEqual(body["first_name"] as? String, "Ifeoma")
    }
    
    func testAddressRequestIncludesNormalizedNIN() {
        let body = AddressRequest(city: "Ikeja", state: "Lagos", country: "NG")
            .withNIN("100 1001-2345")
            .build()
        XCTAssertEqual(body["nin"] as? String, "10010012345")
    }
    
    func testAddressRequestOmitsEmptyNIN() {
        let body = AddressRequest(city: "Ikeja", state: "Lagos", country: "NG")
            .withNIN("  ")
            .build()
        XCTAssertNil(body["nin"])
    }
    
    func testRemovingVerifiedLockedFields() {
        let body = AddressRequest(city: "Ikeja", state: "Lagos", country: "NG")
            .withDetailsForUserAtAddress(firstName: "Ifeoma", lastName: "Adebayo", email: "ifeoma@email.com")
            .withNIN("10010012345")
            .removingVerifiedLockedFields()
            .build()
        XCTAssertNil(body["first_name"])
        XCTAssertNil(body["last_name"])
        XCTAssertNil(body["nin"])
        XCTAssertEqual(body["email"] as? String, "ifeoma@email.com")
    }
    
    func testNINValidation() {
        XCTAssertTrue(AddressRequest.isValidNIN("10010012345"))
        XCTAssertTrue(AddressRequest.isValidNIN("100-1001 2345"))
        XCTAssertFalse(AddressRequest.isValidNIN("1001001234"))
        XCTAssertFalse(AddressRequest.isValidNIN("100100123456"))
        XCTAssertFalse(AddressRequest.isValidNIN("1001001234a"))
        XCTAssertFalse(AddressRequest.isValidNIN(""))
    }
    
    func testRateRequiresSenderVerification() throws {
        let flagged = try JSONDecoder().decode(Rate.self, from: Data(#"{"rate_id":"RT-1","requires_sender_verification":true}"#.utf8))
        let unflagged = try JSONDecoder().decode(Rate.self, from: Data(#"{"rate_id":"RT-2"}"#.utf8))
        XCTAssertTrue(flagged.requiresSenderVerification)
        XCTAssertFalse(unflagged.requiresSenderVerification)
    }
    
    func testVerifyNINResponseDetectsReusedIdentity() throws {
        let flagged = try JSONDecoder().decode(VerifyNINResponse.self, from: Data(#"{"status":true,"message":"Verified","reused":true,"data":{"address_id":"AD-1","country":"NG","verified":true}}"#.utf8))
        let fromMessage = try JSONDecoder().decode(VerifyNINResponse.self, from: Data(#"{"status":true,"message":"Verified with existing identity","data":{"address_id":"AD-1"}}"#.utf8))
        let fresh = try JSONDecoder().decode(VerifyNINResponse.self, from: Data(#"{"status":true,"message":"Verified","data":{"address_id":"AD-1"}}"#.utf8))
        XCTAssertTrue(flagged.result.reused)
        XCTAssertTrue(flagged.result.address.isVerifiedSender)
        XCTAssertTrue(fromMessage.result.reused)
        XCTAssertFalse(fresh.result.reused)
    }
}
