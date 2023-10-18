//
//  GetShipmentPreviewsResponse.swift
//
//
//  Created by maxSpane on 29/09/2023.
//

public struct GetShipmentPreviewsResponse{
    
    /// Details about the page of data being returned
    public let pagination: TShipPageData
    
    /// The list of paginated Shipments.
    public let shipments: [ShipmentPreview]
    
    init(from: GetShipmentsV2){
        pagination = from.pagination
        shipments = from.shipments.map{
            $0.source
        }
    }
    
}
