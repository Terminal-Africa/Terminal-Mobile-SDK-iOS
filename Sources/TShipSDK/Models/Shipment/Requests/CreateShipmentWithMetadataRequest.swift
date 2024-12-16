//
//  CreateShipmentWithMetadataRequest.swift
//  
//
//  Created by maxSpane on 24/04/2023.
//

public class CreateShipmentWithMetadataRequest<Metadata: Encodable>: CreateShipmentRequest {
    
    public var metadata: Metadata?
    
    public func withMetadata(_ metadata: Metadata) -> CreateShipmentWithMetadataRequest{
        self.metadata = metadata
        return self
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(metadata, forKey: .metadata)
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case metadata
    }
    
}
