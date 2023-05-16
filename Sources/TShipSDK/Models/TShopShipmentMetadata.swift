//
//  TShopShipmentMetadata.swift
//  
//
//  Created by maxSpane on 24/04/2023.
//

public struct TShopShipmentMetadata: Codable{
    
    public var tShopStoreName: String?
    public var tShopItemDescription: String?
    public var tShopItemValue: Double?
    public var tShopOrderTrackingNumber: String?
    public var tShopOrderCarrier: String?
    public var tShopOrderTrackingLink: String?
    public var tShopOrderProofOfPayment: String?
    public var tShopCurrency: Currency?
    public var tShopOptInInsurance: Bool?
    
    public init(tShopStoreName: String, tShopItemDescription: String, tShopItemValue: Double, tShopOrderTrackingNumber: String, tShopOrderCarrier: String, tShopOrderTrackingLink: String, tShopOrderProofOfPayment: String, tShopCurrency: Currency = .NGN, tShopOptInInsurance: Bool = false) {
        self.tShopStoreName = tShopStoreName
        self.tShopItemDescription = tShopItemDescription
        self.tShopItemValue = tShopItemValue
        self.tShopOrderTrackingNumber = tShopOrderTrackingNumber
        self.tShopOrderCarrier = tShopOrderCarrier
        self.tShopOrderTrackingLink = tShopOrderTrackingLink
        self.tShopOrderProofOfPayment = tShopOrderProofOfPayment
        self.tShopCurrency = tShopCurrency
        self.tShopOptInInsurance = tShopOptInInsurance
    }
    
    private enum CodingKeys: String, CodingKey {
        case tShopStoreName = "tshop_source_store_name"
        case tShopItemDescription = "tshop_item_description"
        case tShopItemValue = "tshop_item_value"
        case tShopOrderTrackingNumber = "tshop_order_tracking_number"
        case tShopOrderCarrier = "tshop_order_carrier"
        case tShopOrderTrackingLink = "tshop_order_tracking_link"
        case tShopOrderProofOfPayment = "tshop_order_proof_of_payment"
        case tShopCurrency = "tshop_currency"
        case tShopOptInInsurance = "tshop_opt_in_insurance"
    }
    
}
