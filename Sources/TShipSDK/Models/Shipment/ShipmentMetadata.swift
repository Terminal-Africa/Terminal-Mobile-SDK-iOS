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
    }
    
    enum CodingKeys: String, CodingKey {
        case selectedRate = "selected_rate"
        case tShopMetadata = "tshop_metadata"
        case dropOffLocation = "dropoff_data"
    }
    
}
