//
//  GenericElasticModel.swift
//
//
//  Created by maxSpane on 26/09/2023.
//

struct GenericElasticModel<Model: Decodable>: Decodable {
    
    let source: Model
    
    private enum CodingKeys: String, CodingKey {
        case source = "_source"
    }
    
}
