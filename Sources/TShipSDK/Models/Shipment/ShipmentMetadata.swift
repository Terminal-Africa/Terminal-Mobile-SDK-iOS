//
//  ShipmentMetadata.swift
//  
//
//  Created by maxSpane on 29/03/2023.
//

public struct ShipmentMetadata: Decodable{
    
    public let selectedRate: SelectedRate?
    public let tShopMetadata: TShopShipmentMetadata?
    public let dropOffLocation: DropOffLocation?
    public let flaggedMetadata: ShipmentFlaggedMetadata?
    public let dutyPaymentLink: String?
    public let additionalCharges: ShipmentAdditionalCharges?
    
//    public init(tShopMetadata: TShopShipmentMetadata?) {
//        self.tShopMetadata = tShopMetadata
//        selectedRate = nil
//        dropOffLocation = nil
//    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.selectedRate = try? container.decodeIfPresent(SelectedRate.self, forKey: .selectedRate)
        self.tShopMetadata = try? container.decodeIfPresent(TShopShipmentMetadata.self, forKey: .tShopMetadata)
        self.dropOffLocation = try? container.decodeIfPresent(DropOffLocation.self, forKey: .dropOffLocation)
        self.flaggedMetadata = try? container.decodeIfPresent(ShipmentFlaggedMetadata.self, forKey: .flaggedMetadata)
        self.dutyPaymentLink = try? container.decodeIfPresent(String.self, forKey: .dutyPaymentLink)
        self.additionalCharges = try? container.decodeIfPresent(ShipmentAdditionalCharges.self, forKey: .additionalCharges)
    }
    
    enum CodingKeys: String, CodingKey {
        case selectedRate = "selected_rate"
        case tShopMetadata = "tshop_metadata"
        case dropOffLocation = "dropoff_data"
        case flaggedMetadata = "flag"
        case dutyPaymentLink = "duty_payment_link"
        case additionalCharges = "additional_charges"
    }
    
}
