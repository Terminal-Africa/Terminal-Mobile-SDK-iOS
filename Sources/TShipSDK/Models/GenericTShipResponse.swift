//
//  GenericTShipResponse.swift
//  
//
//  Created by Mac on 15/10/2022.
//

import Foundation

struct GenericTShipResponse<Data: Codable>: Codable {
    let status: Bool
    let message: String
    let data: Data
}
