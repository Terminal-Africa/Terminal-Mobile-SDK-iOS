//
//  ApiResponse.swift
//  Yummie
//
//  Created by Mohammed Adetunji on 13/10/2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
