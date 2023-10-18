//
//  GetShipmentsV2.swift
//
//
//  Created by maxSpane on 26/09/2023.
//

struct GetShipmentsV2: Decodable {
    
    /// Details about the page of data being returned
    let pagination: TShipPageData
    
    /// The list of paginated Shipments.
    let shipments: [GenericElasticModel<ShipmentPreview>]
    
}
