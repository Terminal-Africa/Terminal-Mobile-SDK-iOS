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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pagination = (try? container.decode(TShipPageData.self, forKey: .pagination)) ?? .init()
        self.shipments = (try? container.decode([GenericElasticModel<ShipmentPreview>].self, forKey: .shipments)) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case shipments
    }
    
}
